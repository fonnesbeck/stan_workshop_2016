
library(ggplot2)
library(plyr)
library(rstan)
rstan_options(auto_write = TRUE)
options(mc.cores = parallel::detectCores())

cox_model <- 
"data {
    int<lower=0> Nsubj; 
    int<lower=1> T;
    vector[Nsubj] pscenter;
    vector[Nsubj] hhcenter;
    int<lower=0,upper=1> ncomact[Nsubj];
    int<lower=0,upper=1> rleader[Nsubj];
    int<lower=0,upper=1> dleader[Nsubj];
    vector[Nsubj] inter1;
    vector[Nsubj] inter2;
    int<lower=0,upper=1> FAIL[Nsubj];
    int<lower=0> obs_t[Nsubj];
    int<lower=0> t[T+1];
    
} 

transformed data {
    int<lower=0> Y[Nsubj, T];
    int<lower=0> dN[Nsubj, T];
    
    # Set up data
    for(i in 1:Nsubj) {
        for(j in 1:T) {
            # risk set = 1 if obs_t >= t
            Y[i,j] <- int_step(obs_t[i] - t[j]);
            # counting process 
            dN[i,j] <- Y[i, j] * int_step(t[j + 1] - obs_t[i]) * FAIL[i];
        }
    }
}

parameters {
    vector[7] beta;
    real<lower=0> c;
    real<lower=0> r;
    vector[T] dL0;   
}

transformed parameters {
    vector[T] mu;
    matrix[Nsubj, T] Idt;
    vector[T] dL0_star;
    
    for(j in 1:T) {
        for(i in 1:Nsubj) {
            # Intensity
            Idt[i, j] <- Y[i, j] * exp(beta[1]*pscenter[i] + beta[2]*hhcenter[i] + beta[3]*ncomact[i] 
                        + beta[4]*rleader[i] + beta[5]*dleader[i] + beta[6]*inter1[i] + beta[7]*inter2[i]) * dL0[j];
        }     
        # prior mean hazard 
        mu[j] <- dL0_star[j] * c;   
        
        dL0_star[j] <- r * (t[j + 1] - t[j]);
    }
} 

model {
    
    for(j in 1:T) {
        for(i in 1:Nsubj) {
            # Likelihood
            dN[i, j] ~ poisson(Idt[i, j]);  
        }     
        dL0[j] ~ gamma(mu[j], c);
    }
    
    c ~ gamma(0.0001, 0.00001);
    r ~ gamma(0.001, 0.0001);
    
    beta ~ normal(0.0, 100000);
}"

data <- read_rdump('survival.data.r')

inits <- list(c1=list(beta=c(-.36,-.26,-.29,-.22,-.61,-9.73,-.23),  c=0.01, r=0.01, 
    dL0=c(1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1)))


fit <- stan(model_code=cox_model, data=data, init=inits, iter=2000, chains=1, verbose=F)

print(fit)
