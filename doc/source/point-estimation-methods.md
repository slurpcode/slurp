# 🖩 Point Estimation Methods

In the previous article we could see how the estimators support through the maximum likelihood method. But now we are going to study another method to obtain point estimators and it is the moment method.

## Moment Method

The idea of this method is to match the population characteristics with the corresponding sample characteristics. Suppose we have a random variable x that has a point probability function for the discrete case p(x) or for the continuous case f(x) with a density function. We will call the moment of order k or population moment E(x^k), if the hopes exist.

When studying the moment-generating function for a random variable. We can see that the moments are related to the parameters that are part of an associated distribution.

Suppose a random sample of order k: x1, x2,…, xn, the sample moment is:

`(∑_(i=1)^n▒x_i^k )/n`

Given a random sample x1, x2, x3,…, xn from a distribution whose point probability function or perhaps its density function depends on m number of parameters θ1, θ2,…, θm and the moment estimators are obtained by equating the moments populations with their corresponding sample moments, that is, for this it will be necessary to solve the following system of equations:

`E(x^k)= (∑_(i=1)^n▒x_i^k )/n`

On the left side of the equation we have the population moments and they are equal to the right side of the equation, where we will have the sample moments.

If we have a single parameter, we only have to find the first population moment and we will have a single equation:

`E(x) = 1/n ∑_(i=1)^n▒x_i`

But given the case that we have two parameters, we must solve the system of equations between the first population moment and the second population moment:

1st population moment:
`E(x) = 1/n ∑_(i=1)^n▒x_i`

2nd population moment:
`E(x^2)= 1/n ∑_(i=1)^n▒〖x_i〗^2`

Therefore, as many moments are equal as parameters it finds to estimate. It is important to take into account that the sample moments only depend on the random sample, while the population moments will most likely appear in the parameters that we want to estimate, that is, it is from there that we will obtain the equations to clear the parameters that we require estimate.

We are going to find the left side of the equation by calculating the mathematical expectation and in this way we will obtain an equation that contains the parameter to be able to solve it.

## Mathematical hope

When we have a random variable X, the mean value that represents this variable is what we call the mathematical expectation or expected value.

This expected value is obtained by adding the probabilities of a random event, multiplied by the value of that random event. In other words, it is the mean value of a certain data set or the mean value that an event has occurred. When we talk about discrete distributions, we refer to those that have the same probability for each event and in this case the mean will be equal to the mathematical expectation.

## Example of mathematical expectation

Let's go with an example to find the mathematical expectation of an event: suppose that we throw a six-sided die and the random variable is defined by x squared of the result that the die shows when it falls. What would be the mathematical expectation of x?

Since x is the square of the result, the values that the random variable will take are: 1, 4, 9, 16, 25 and 36. On the other hand, what is the probability that any of the heads will fall? Each head has a 1/6 chance.

|   x   | 1   | 4   | 9   | 16  | 25  | 36  |
| :---: | --- | --- | --- | --- | --- | --- |
| P(x)  | 1\6 | 1\6 | 1\6 | 1\6 | 1\6 | 1\6 |
| :---: |

According to the mathematical expectation formula, we must carry out the summation of the multiplication of the values that x takes multiplied by its probability, that is:

`E(x) = ∑▒〖x.P(x)〗 = 1. 1/6 + 4. 1/6 + 9. 1/6 + 16. 1/6 + 25. 1/6 + 36. 1/6`

`E(x) = 91/6 ≈ 15.17`

This value being the mathematical expectation of the event

Example 2 to find the mathematical expectation:

Suppose we have a discrete random variable whose probability distribution is given by:

`P(x) = {█(kx x=1,2,3,4 y 5@ k(10-x) x=6,7,8,9)┤`

Find the value of the constant k

To find the probability of the values of between 1 and 5, we simply need to multiply them by k. But for the values of x that are between 6 and 9 (both inclusive) we must apply the formula k (10 – x) so:

|   x   | 1   | 2   | 3   | 4   | 5   | 6       | 7       | 8       | 9       |
| :---: | --- | --- | --- | --- | --- | ------- | ------- | ------- | ------- |
| P(x)  | 1k  | 2k  | 3k  | 4k  | 5k  | k(10-6) | k(10-7) | k(10-8) | k(10-9) |
| :---: |

|   x   | 1   | 2   | 3   | 4   | 5   | 6   | 7   | 8   | 9   |
| :---: | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| P(x)  | 1k  | 2k  | 3k  | 4k  | 5k  | 4k  | 3k  | 2k  | 1k  |
| :---: |

In order to find the constant k we must take into account that the sum of the probabilities is always equal to unity:

`∑▒〖P(x)=1〗`

`1k + 2k + 3k + 4k + 5k + 4k + 3k + 2k + 1k = 1`

`25k = 1`

`k = 1/25`

Once the value of k is known, we can find the mathematical expectation

`E(x) = ∑▒〖x.P(x) 〗 = 1. 1/25 + 2. 2/25 + 3. 3/25 + 4. 4/25 + 5. 5/25 + 6. 4/25 + 7. 3/25 + 8. 2/25 + 9. 1/25`

`E(x) = 5`

Once we know how to calculate the mathematical expectation, we can carry out a population moment exercise.

## Exercise 1 Of Moments

Let x be a random variable with a probability density function that is given by:

`f(x) = {█(θx^(θ-1),0<x<1@0, the others x)┤`

Where this function depends on a parameter θ, which in principle is unknown and with the density function I am going to calculate its expected value, but in this case, we will have to integrate in order to find it since it is a continuous function.

`E(x) = ∫_0^1▒〖x.〗 θx^(θ-1) dx = θ/(θ+1)`

It is only integrated in the interval from 0 to 1, since otherwise, it takes the value of zero (0).

Once we have the expected value, I will choose a random sample from my population: X1, X2,…, Xn and to find the mean of the sample I use the formula that we put on the right side of our moment equation, that is:

`X ̅ = 1/n ∑_(i=1)^n▒Xi`

It is important to take into account that a circumflex is placed on θ ̂ because it is already being considered as an estimator, now it only remains to clear θ ̂

`θ ̂= X ̅/(1- X ̅ )`

We now go with a second example of the method of moments with two parameters: suppose that we have a random variable whose distribution is normal N (μ, σ) where μ is the mean and has a standard direction σ. As we already know, the expected value for the first moment is the mean and therefore:

`E (x) = μ`

While the second population moment will be equal to the variance plus the mean, both squared, that is:

`E (X^2)= μ^2+ σ^2`

Equating the first moment with the sample average and the second moment with the second sample moment we have:

`μ= X ̅ (1)`

`μ^2+ σ^2= 1/n ∑_(i=1)^n▒X_i^2 (2)`

As we can see, we have two equations with two unknowns, since we have two parameters in this exercise. Being our unknowns the parameters μ and σ. If we substitute equation (1) in (2) we have:

`X ̅^2+ σ^2= 1/n ∑_(i=1)^n▒X_i^2`

`σ^2= 1/n ∑_(i=1)^n▒X_i^2 - X ̅^2`

Once we solve for σ we can place the circumflex, because it will be one of the estimators of this situation and also, carrying out the inverse process of the variance we can factor the right side of the equation and therefore we are left as:

`σ ̂^2 = 1/n ∑_(i=1)^n▒〖(X_(i )- X ̅)〗^2`

It is important to emphasize that it is not just any factorization, since many will think that if we make the notable product of the last equation, we would need a term to arrive at the previous formula, but that missing term would be `-2X_(i ) X ̅,` which By the summation that is ahead we would have `2X ̅ (∑_(i=1)^n▒X_i )/n = 2(X ) ̅X ̅ = 2X ̅^2` that by subtracting `X ̅^(2 )` I have only one `X ̅^2` and that is why the factorization remains like this.

On the other hand, we can realize that the right side of the equation is nothing more than the variance of the non-grouped data, so substituting we have:

`σ ̂^2= S^2`
`μ= X ̅`

So we already have the value of the two parameters

## Important Concepts When Conducting A Statistical Hypothesis Test

In many situations the researcher, based on his previous experience, has a priori belief regarding the phenomenon he is studying and regarding the parameters of the process. That is why the researcher will be very interested in estimating the values of these unknown parameters. However, the process does not end there, since you will also have to contrast the possible hypotheses regarding the probability distribution of the population under study, from which the available sample was generated.

In general, the hypotheses refer to the sample information and it is necessary to find out if this information is consistent with his belief about the parametric values. Because otherwise, there would be a problem with the sample, in addition there are times when the researcher has two samples and of course he will question whether the information from both samples comes from the same population or from different populations.

The a priori idea of statistical testing is that the researcher has reasons to believe in the certainty of the null hypothesis and the alternative hypothesis is defined by that circumstance incompatible with the definition of the null hypothesis and a probability event that has been considered null. , must be neither in the alternative hypothesis nor in the null hypothesis. So the researcher must ask himself when he is performing a hypothesis test, if he has enough evidence in the chosen sample to accept or reject the null hypothesis.

So we already have the value of the two parameters

## Important concepts when conducting a statistical hypothesis test

In many situations the researcher, based on his previous experience, has a priori belief regarding the phenomenon he is studying and regarding the parameters of the process. That is why the researcher will be very interested in estimating the values of these unknown parameters. However, the process does not end there, since you will also have to contrast the possible hypotheses regarding the probability distribution of the population under study, from which the available sample was generated.

In general, the hypotheses refer to the sample information and it is necessary to find out if this information is consistent with his belief about the parametric values. Because otherwise, there would be a problem with the sample, in addition there are times when the researcher has two samples and of course he will question whether the information from both samples comes from the same population or from different populations.

The a priori idea of statistical testing is that the researcher has reasons to believe in the certainty of the null hypothesis and the alternative hypothesis is defined by that circumstance incompatible with the definition of the null hypothesis and a probability event that has been considered null. , must be neither in the alternative hypothesis nor in the null hypothesis. So the researcher must ask himself when he is performing a hypothesis test, if he has enough evidence in the chosen sample to accept or reject the null hypothesis.

As we already know, the null hypothesis is the reflection of a belief of the researcher and he will only be able to reject it in favor of the alternative hypothesis, only if there is sufficient evidence against it. It is important to contrast null hypotheses of which the researcher has founded an a priori belief, since contrasting the hypotheses is not something that should be done mechanically or systematically and it would also be completely absurd to consider an experiment with a high number of hypothesis contrasts. , where they are rejected and approved empirically, but without a pre-established orientation or awareness of what is being done.

To test the null hypothesis, numerical values are assigned to one or more unknown numerical parameters, in comparison with another value that is assigned to the alternative hypothesis. For this, it is necessary to have sample information, in which it is necessary to calculate a statistic that is closely related to the parameter around which the contrast is required. The value obtained from the statistic will indicate whether the hypothesis established a priori is acceptable, with respect to the value of the unknown parameter or, if not, whether the null hypothesis is rejected and the alternative hypothesis is accepted.

Hypothesis testing is carried out in several stages:

1. State the null hypothesis (Ho) and the alternative hypothesis (Ha), both being in reference to the unknown parameter.
2. Decide which statistic is appropriate to summarize the information of the sample, of course, with respect to the parameter on which the test is to be performed.
3. Divide the sample space into two regions, the acceptance region and the critical region.
4. Obtain a sample of an adequate size in which the characteristic of interest can be collected.
5. Calculate the sample statistic.
6. Observe if the statistic falls in the critical zone to reject the null hypothesis or in the acceptance region to approve it.

Let's go to a practical example: Let's suppose that a certain cosmetics company carries out an advertising campaign, which of course represents a huge expense, part of the campaign is about the success of its perfumes in a certain city and you want to verify if the campaign has been effective, in order to implement it at the national level. It is evident that in order to obtain a reliable result, the sample from the city to be studied must be representative since there is no reason to think that the change in the proportion of clients before and after the campaign will be different in the rest of the country than in the pioneer city.

![Woman Advertising Board](_static/images/point-estimation-methods/image1.jpg)

After the campaign, the marketing department of this cosmetics company conducts a survey in the city of interest and interviews 200 people. The percentage of people who habitually bought their perfume before the advertising campaign was 5%, the company for its part sets a goal of reaching 7% to assume that the campaign has been effective. However, the proportion of consumers after the campaign is not known and the only thing we have is the survey of those 200 people. For this, it will be necessary to calculate an estimate of the proportion of consumers after the campaign and the first thing to do is choose the estimator of the parameter that will be the object of the contrast.

As we already know, the proportion of the sample is an unbiased estimator with respect to the population proportion and therefore, what seems more reasonable is to use the percentage of the sample. Suppose then that 15 people answer having purchased the perfume after the campaign and as we know, this represents 7.5% of the respondents, so that it can be concluded that the campaign has been a success. But proceeding in this way is to assign absolute reliability to the information obtained in the sample and this induces us to compare the estimate obtained in the sample, with the pre-established threshold of 7%. What happens is that the estimate is only a realization of the estimate, which in this case is the sample proportion and it is most likely that if we had taken a different sample, the result could be different, unless we interviewed each and every one of potential consumers in the city.

![Rose Perfume](_static/images/point-estimation-methods/image2.jpg)

Treating sample variations appropriately is very important, since nothing prevents us from having an estimate like the one mentioned above, even if the population proportion is practically the same as before launching the advertising campaign. On the other hand, it would be too costly to extend the campaign nationwide if we are not sure that it is actually effective. We could even be incurring a Type I Error, if in the absence of a significant change in the number of consumers before and after the campaign, the null hypothesis is rejected, by assuming the change in proportion in the sample information.

If, on the other hand, if we obtained only 13 affirmative answers they represent a proportion of 6.5%, this would lead us not to reject the null hypothesis, even when consumption has increased with respect to the existing consumption before the campaign. This is what is called a Type II Error, which consists of not rejecting the null hypothesis, even when it is false.

We are going to formalize the process: we want to test the null hypothesis in which it is established that the campaign has not had an effect and, therefore, that the percentage of consumer customers is not significantly higher than the number of consumers before carrying out the campaign advertising.

The null hypothesis is determined as follows:

`Ho: p = 0.05`

In this null hypothesis, a single value of the unknown parameter is determined and to compare it, we must formulate an alternative hypothesis and in it, the values of the parameter will be collected to accept or reject the null hypothesis. Let's assume for the moment that:

`Ha: p ≠ 0.05`

As we can see, the alternative hypothesis in this case is composite, since it includes a whole range of alternative values with respect to the unknown parameter. On the contrary, we can say that the null hypothesis is simple, since it establishes a unique probability distribution and if it is true, the indicator variable of the probability distribution for each person who consumes the perfume will take the value of 1 and if it does not, it will take the value of zero (0). In this way, the probability distribution will be determined as a Bernoulli see distribution with p = 0.05. If we determine a type I error it would be to reject the null hypothesis and accept the alternative, even when Ho is true and a type II error would be not to reject the null hypothesis when the alternative hypothesis is true and therefore Ho is false.

The size of a hypothesis test or its level of significance is the probability we have of committing a type I error and the power of a test would be to reject the null hypothesis in the case of being false, which is precisely what we want. to get. That is why we must reduce the difference in significance of the contrast and raise the power of the contrast as much as possible. Suppose that we denote by the symbol β the possibility of committing a type II error, this implies that the power of the test will be equal to 1- β since:

`P [Do not reject Ho / Ho is false] + P [Reject Ho / Ho is false] = 1`

The first being adding equal to β. It is important to emphasize that the way to solve the hypothesis contrast will be different depending on the alternative hypothesis, since the latter can be simple or compound. Given the case that it is composite, then the hypothesis test will be carried out in a different way, since it will depend on the range of the alternative parametric values. For this case, a two-tailed test is applied, in which the null hypothesis is rejected when there is much evidence against it and this occurs when the proportion of the sample differs substantially from p = 0.05. Another important point is that it cannot be accepted that the advertising campaign has a detrimental effect with respect to consumption in a priori way, that is, the proportion of perfume consumers will be lower after the advertising campaign, so the recommended alternative hypothesis is that it is:

`Ha: p > 0.05`

In this case, we will observe evidence against the null hypothesis given the case that we obtain, a proportion of the sample that is relatively high.

## When the type of contrast that we are carrying out when the problem is two samples is

`Ho: ph = pm`

This is an example for the proportion of smokers that exist among the students of the engineering faculty, which is determined as being the same for both men and women and in this case, two samples would have to be drawn, one for each population group . The alternative hypothesis would be that both proportions are simply different:

`Ha: ph ≠ pm`

We can also establish a somewhat stricter alternative hypothesis, which is that the proportion of smokers that exists among male students is higher than that of female smokers:

`Ha: ph > pm`

The way to solve the hypothesis test will be different depending on the specification of the alternative hypothesis. For the case where it is established that the alternative hypothesis is to state that the population of male smokers is different from the population of smokers, a two-tailed contrast would be carried out. While in the second alternative hypothesis, where it is established that the population of smokers is greater than that of female students, a single-tailed test would be carried out.

![Male Smoking](_static/images/point-estimation-methods/image3.jpg)

The idea of this type of problem is not precisely to test a numerical value for both parameters, but only to demonstrate that both are equal to each other. However, as the contrast is carried out, the proportions of each population will also be estimated, if they are potentially different or estimate a single proportion, but using both samples, that in the case of not rejecting the null hypothesis.

![Female Smoking](_static/images/point-estimation-methods/image4.jpg)

Another way of dealing with hypothesis testing is through the equality of variance or mathematical expectations between possible different populations.

## Hypothesis testing regarding proportions

It is important to find the ideal method when carrying out a hypothesis test, for the case we are studying, where we want to test the population proportion. We are going to keep the assumption about the rule of rejection determined a priori, which is if the estimator of the sample proportion after the advertising campaign is equal to or greater than 0.07.

We can commit a type I error when rejecting the null hypothesis being true, since the decision rule is to reject Ho when the proportion of the sample is equal to or greater than 0.07 and is denoted as p = X/n since the level of contrast significance is:

`α=P(p≥0.07/ p =0.05)= P( X/n ≥0.07 / p = 0.05)`

X being the number of clients who use the perfume among the people interviewed and n is the number of the sample, which in this case is 200. To find the probability, we use the information that, as is a Bernoulli probability distribution, the sum of the values of X would be a function of B(n,p) and therefore:

`α=P(p≥0.07/ p =0.05)= P(X ≥ (0.07)(200) = 14 / p = 0.05)`

`α=1- ∑_(i=0)^13▒P(X=i/p=0.05) = 1 - ∑_(i=0)^13▒(200¦i) 〖(0.05)〗^i 〖(0.95)〗^(200-i)`

As we can see, calculating each of the addends is a somewhat complex process, so it is preferable to use the Poisson approximation in the binomial distribution or the normal approximation can also be used, when the probability p is small, however, the product np is quite large, so we have np = (200) (0.05) = 10. With this value λ = 10 and the number equal to 13 (which is the maximum value to take), we will go to the tables of the Poisson distribution and from there we obtain:

The probability that the variable takes these numerical values is: 0.8645, so that α = 1 - 0.8645 = 0.1355, this being the contrast significance. In the same way, we could calculate the probability of committing a type II error, but for this it is necessary to assume that the population proportion has undergone a change and now has a new value of p '. Let's suppose that now p '= 0.6 and even though it is unknown, we must remember that the null hypothesis is not rejected if X <14, so:

`β = P( X < 14 / p´ = 0.06) = ∑_(i=0)^13▒(200¦i) 〖(0.06)〗^i 〖(0.94)〗^(200-i) = 0.682`

When we look for the value in the Poisson distribution tables for λ = np = (200) (0.06) = 12. But what if we want to calculate assuming that p´ = 0.07, we realize that λ = np = (200)(0.07) = 14 and when calculating β = 0.464. Therefore if we keep increasing the value of p '= 0.8 the value of λ = 16 and β = 0.275. This implies that if the true proportion of current perfume consumers exceeds 5%, the probability that we have of committing a type II error will be less as the difference between the proportion before the advertising campaign and the proportion that is get after the campaign.

Depending on the strategy used to carry out the contrast, the values of α and β will vary. If the cosmetics company wanted to exceed 7% of consumers after the campaign, it would be being very demanding when rejecting the null hypothesis. While it is true that this implies a low probability of committing a type I error, the probability of committing a type II error would be quite high and this would imply that we would be demanding a lot of evidence against the null hypothesis to reject it, that is, , would increase the probability of not rejecting the null hypothesis even if it is false.

`α=P( X ≥ 16/p= 0.05)= 1-∑_(i=0)^15▒(200¦i) (0.05)^i (0.95)^(200-i) = 1-0.951`
`α=0.049`

As we can see, the probability of committing type I error is much lower than that obtained with the 7% threshold, remember that it was α = 0.136.

We can then come to the conclusion that depending on the strategy adopted a priori when carrying out the contrast, it will directly affect the probability levels of committing both errors. We can also conclude that by varying the rejection threshold, the probability of committing one of the types of error can be reduced, but always at the cost of increasing the other type of error.

## About The Author

Idais, Graduated in Mechanical Engineering, and a master’s degree in teaching component, she gave classes in several institutes of mathematics and physics, but she also dedicated several years of my life as a television producer, she did the scripts for mikes, the camera direction, editing of video and even the location. Later she was dedicated to SEO writing for a couple of years. she like poetry, chess and dominoes
