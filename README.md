# Healthcare Research

## Introduction 

In this research we first use a mixture of gaussian models to describe the duration between the two highest peaks in the signal of one footstep. We recorded this value from the patient through time and notice that it follows the distribution dictated by a mixture of two gaussians. The signal recorded is therefore assumed to come from two gaussians  (one gaussian corresponds to the fatigued state and the second to the non-fatigued state). We use the Expectation Maximization algorithm to learn the parameters of the two gaussians. This step allows us to personalized the algorithm to the patient. Even though most of the patients have mostly identical fatigued and non-fatigued models (10 for &mu; and 1 and .1 for &sigma; resp for the fatigued and non-fatigued models) we thought that personalizing the algorithm to learn the parameters from the subject would make the prediction even more effective. 
Once we have learn the parameters from the data we can make prediction using the forward-backward algorithm. For the assignment we simply cluster by taking the class with the highest probability. 

<img src="https://github.com/allarassemjonathan/Fatigue_Detection_algorithm/blob/main/pic.PNG" width=400 height=300>

## Personalization or Learning the parameters of the mixture of Gaussian

We use the Expectation Maximization to learn the parameters.<br>
1 - Randomly initialize the parameters of the two models (&mu; and &sigma;) as well as &pi; the parameter of the latent variable. Randomly initialize the 2xn vector  &gamma; that will hold the conditional probabilities for the individual datapoints given the value of the latent Z.<br>
2 - Compute the new value of &gamma; with the randomly generated model.<br> <br>
<img src="https://github.com/allarassemjonathan/Fatigue_Detection_algorithm/blob/main/im2.PNG" width=400 height=400> <br><br>
3 - Compute the new value for the mean and deviation of the two models.<br>
4 - Compute the new value of the parameter of the latent &pi;.<br> <br>
<img src="https://github.com/allarassemjonathan/Fatigue_Detection_algorithm/blob/main/im4.PNG" width=400 height=300><br><br>
5 - Run instruction 2- while the difference in the parameters of the models is greater than an arbitrary value &epsilon;.

Below we can see how the algorithm is run until the values of the parameters start converging breaking the condition put on the &epsilon;. 
In this example &epsilon; 's value is 10^-20.

<img src="https://github.com/allarassemjonathan/Fatigue_Detection_algorithm/blob/main/EMrunning.PNG" width=800 height=500>

## Assessment or predictions of the latent state of the runner

Once the model is learned we can start making predictions. We use the forward backward algorithm for that. It can be easily derived from the bayesian network. 
First we have to find the joint distribution from the network:<br><br>
<img src="https://github.com/allarassemjonathan/Fatigue_Detection_algorithm/blob/main/im5.PNG" width=400 height=400><br><br>

The Markov Chain is learned from data through a Monte Carlo process, the others parameters are learned from the Personalization part. Using the Bayes rule we can derive that in fact the likelihood is proportional to the joint distribution. From that we can use the below expression to compute the likelihood of the data.

<img src="https://github.com/allarassemjonathan/Fatigue_Detection_algorithm/blob/main/im6.PNG" width=400 height=50><br><br>

We notice that after doing the backward part of the algorithm, we find pretty much the same estimation hence for computational reasons we decided not to to a backward run and to estimate by multiplying the two. 

## Results 

We were able to achieve 99% accuracy on test data and are waiting for the data from the patients to be able to run the entire process after a run of the athlete. 
