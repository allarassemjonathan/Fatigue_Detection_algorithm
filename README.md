# Healthcare Research

## Introduction 

In this research we first use a mixture of gaussian models to describe the duration between the two highest peaks in the signal of one footstep. We recorded this value from the patient through time and notice that it follows the distribution dictated by a mixture of two gaussians. The signal recorded is therefore assumed to come from two gaussians  (one gaussian corresponds to the fatigued state and the second to the non-fatigued state). We use the Expectation Maximization algorithm to learn the parameters of the two gaussians. This step allows us to personalized the algorithm to the patient. Even though most of the patients have mostly identical fatigued and non-fatigued models (10 for mu and 1 and .1 for resp the fatigued and non-fatigued models) we thought that personalizing the algorithm to learn the parameters from the subject would make the prediction even more effective. 
Once we have learn the parameters from the data we can make prediction using the forward-backward algorithm. For the assignment we simply cluster by taking the class with the highest probability. 

<img src="https://github.com/allarassemjonathan/Fatigue_Detection_algorithm/blob/main/pic.PNG" width=200 height=400>

## Learning the parameters of the mixture of Gaussian

We use the Expectation Maximization to learn the parameters.<br>
1 - Randomly initialize the parameters of the two models (&mu; and &sigma;) as well as &pi; the parameter of the latent variable. Randomly initialize the 2xn vector  &gamma; that will hold the conditional probabilities for the individual datapoints given the value of the latent Z.<br>

<img src="https://github.com/allarassemjonathan/Fatigue_Detection_algorithm/blob/main/im1.PNG" width=300 height=30>
2 - Compute the new value of &gamma; with the randomly generated model.<br>

3 - Compute the new value for the mean and deviation of the two models.<br>
4 - Compute the new value of the parameter of the latent &pi;.<br>
5 - Run instruction 2- while the difference in the parameters of the models is greater than an arbitrary value &epsilon;.

Below we can see how the algorithm is run until the values of the parameters start converging breaking the condition put on the &epsilon;. 
In this example &epsilon; 's value is 10^-20.

<img src="https://github.com/allarassemjonathan/Fatigue_Detection_algorithm/blob/main/EMrunning.PNG" width=800 height=620>

## Making predictions

Once the model is learned we can start making predictions. We use the forward backward algorithm for that. It can be easily derived from the bayesian network. 
Let us recall that the observations X follows a normal distribution of mean  μ_k and deviation  σ_k: X ~ N(μ_k,σ_k ). In the same way the latent variable Z is sampled from a categorical from the vector π_k:  Z ~ cat(Z;π_k )
