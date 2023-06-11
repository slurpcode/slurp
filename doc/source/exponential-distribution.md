# ✖️ Exponential Distribution

The exponential distribution is equivalent to the discrete geometric distribution, but for continuous random values ​​and we know that we are in the presence of an exponential distribution when, for example: We are interested in knowing the time it takes for a certain event to occur, but knowing that the time elapsed and measured from any time t until the event occurs at instant tf, it will not depend on the time elapsed in advance in which absolutely nothing happened.

## Some examples of exponential distribution

1. When we successively repeat an experiment in a Poisson process but in equal time intervals and the time elapsed between the occurrence of two consecutive events, is in accordance with an exponential probabilistic model. To clarify a little more, suppose that we are going to measure the time elapsed between two injuries that have occurred in the body, which may be relevant.

2. The elapsed time in which a radioactive particle takes to disintegrate. This is very commonly used in science for dating fossils or some organic matter through the carbon 14 technique.

3. The time elapsed in an emergency service for the arrival of a patient.

![Arrival of a patient](_static/images/exponential-distribution/arrival-of-a-patient.png)

4. The time it takes for a pharmacist to serve a client or for a doctor to carry out a certain examination.

## The density function of a continuous random variable that is exponentially distributed is defined by

![f(x) = \\lambda e\^{-\\lambda x}](https://latex.codecogs.com/png.image?%5Cinline%20%5Cdpi%7B100%7Df%28x%29%20%3D%20%5Clambda%20e%5E%7B-%5Clambda%20x%7D%0A%0A%0A%0A "f(x) = \\lambda e^{-\\lambda x}" )

Being ![x > 0](https://latex.codecogs.com/png.image?%5Cinline%20%5Cdpi%7B100%7Dx%20%3E%200%0A%0A%0A%0A "x > 0")

The distribution function is determined as:

![F(x) = \\begin{cases} 1 - e\^{-\\lambda x} \& \\quad \\\ 0;\\varepsilon \\text{ the other case } \\end{cases}](https://latex.codecogs.com/png.image?%5Cinline%20%5Cdpi%7B100%7DF%28x%29%20%3D%20%5Cbegin%7Bcases%7D%201%20-%20e%5E%7B-%5Clambda%20x%7D%20%26%20%5Cquad%20%5C%5C%200%3B%5Cvarepsilon%20%5Ctext%7B%20the%20other%20case%20%7D%20%5Cend%7Bcases%7D%0A%0A%0A "F(x) = \\begin{cases} 1 - e\^{-\\lambda x} \& \\quad \\\ 0;\\varepsilon \\text{ the other case } \\end{cases}" ) si ![x > 0](https://latex.codecogs.com/png.image?%5Cinline%20%5Cdpi%7B100%7Dx%20%3E%200%0A%0A%0A%0A "x > 0")

The formulas corresponding to the expected value and the variance have:

![E(x) = 1/\\lambda](https://latex.codecogs.com/png.image?E%28x%29%20%3D%201%2F%5Clambda%0A%0A%0A%0A%0A "E(x) = 1/\\lambda" )

![Var(x) = 1/\\lambda\^{2}](https://latex.codecogs.com/png.image?Var%28x%29%20%3D%201%2F%5Clambda%5E%7B2%7D%0A%0A%0A%0A%0A%0A "Var(x) = 1/\\lambda\^{2}" )

## Applications of the exponential distribution

This type of distribution has a wide practical utility, which can be considered as a perfectly adequate model when we refer to a probability distribution of the time that occurs between two events and that in turn follow a Poisson process.

An exponential distribution can be derived from an experimental Poisson investigation, even with its same characteristics when denouncing the Poisson distribution, only in this case, the random variable is taken as the time it takes for an event to occur.

When we refer to the Poisson distribution, in this case the events per unit of time are described, while the exponential distribution is responsible for studying the time that exists between each of these events. Therefore, when the arrivals are Poisson, it can be said that the time between these arrivals is given by an exponential distribution.

Another big difference is that the exponential distribution is continuous, since the time between one event and another does not necessarily correspond to an integer, while the Poisson distribution is completely discrete.

When we are using the exponential distribution, it is important to assume that the arrival times are not random, that is, that a certain arrival time will not depend on another arrival or service carried out in advance, nor on the possible queue that may form. An important feature to take into account in this type of distribution is precisely that it has no "memory". We will try to clarify this point through an example: suppose that in a surgical room the attention time dedicated to a patient follows an exponential distribution. Given the case that a certain patient has already been operated on for 6 hours, the probability that the operation will last one more hour is going to be the same as if the patient had had two or 10 hours of operation up to now (whichever they may be). This is because the times of the operation have a great variability and this happens in the exponential distribution. Perhaps the next patient to be operated on will only last an hour in the operating room, since his surgery is likely to be much simpler than the previous patient's.

![Operating room](_static/images/exponential-distribution/operating-room.png)

Let's go with the first example of exponential distribution: suppose we have an online computer terminal whose response time is x, specifically the variable x being the time that elapses between the user's query and the beginning of the system's response to this query, we also know that it has an exponential distribution and that the expected response time is 5 seconds. It is required to calculate the probability that the response time is at most 10 seconds.

As we know then the random viable follows the exponential distribution so that:

![x \\sim Exp(\\lambda)](https://latex.codecogs.com/png.image?%5Cinline%20%5Cdpi%7B100%7Dx%20%5Csim%20Exp%28%5Clambda%29%0A%0A%0A%0A%0A%0A%0A%0A%0A "x \sim Exp(\lambda)" )

We can see that this type of distribution only depends on the parameter λ that we do not know at first. However, in the problem statement we are informed that the time elapsed between the user's query and the system's response has an expected time of five seconds, this indicates the expected value. On the other hand, we know that the expected value is equal to:

![E(x) = 1/\\lambda = 5](https://latex.codecogs.com/png.image?%5Cinline%20%5Cdpi%7B100%7DE%28x%29%20%3D%201%2F%5Clambda%20%3D%205%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A "E(x) = 1/\\lambda = 5"), therefore:

![\\lambda = 1/5 = 0.2](https://latex.codecogs.com/png.image?%5Cinline%20%5Cdpi%7B100%7D%5Clambda%20%3D%201%2F5%20%3D%200.2%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A "\\lambda = 1/5 = 0.2" )

When calculating the probability that the response time is a maximum of 10 seconds, we can express it as:

![P( x \\leq 10) = 1 - e\^{-\\lambda x} = 1 - e\^{-0.2 x}\|\_0\^1\^0 = 1 - e\^{-0.2(10)} = 0.8646](https://latex.codecogs.com/png.image?%5Cinline%20%5Cdpi%7B100%7DP%28%20x%20%5Cleq%2010%29%20%3D%201%20-%20e%5E%7B-%5Clambda%20x%7D%20%3D%201%20-%20e%5E%7B-0.2%20x%7D%7C_0%5E1%5E0%20%3D%201%20-%20e%5E%7B-0.2%2810%29%7D%20%3D%200.8646%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A "P( x \\leq 10) = 1 - e\^{-\\lambda x} = 1 - e\^{-0.2 x}\|\_0\^1\^0 = 1 - e\^{-0.2(10)} = 0.8646" )

We can conclude that the response time is a maximum of 10 seconds is 86.46%.

Example two of exponential distribution: a certain company manufactures video cards for PCs and the following information is available: the duration of the video cards expressed in years are distributed exponentially and 9.6% of these video cards fail before after one year of use. It is required to determine the probability that a randomly selected computer video card will fail after two years of use.

![Computer video card](_static/images/exponential-distribution/computer-video-card.png)

X = lifetime of PC video cards in years

![X \\sim Exp(\\lambda)](https://latex.codecogs.com/png.image?%5Cinline%20%5Cdpi%7B100%7DX%20%5Csim%20Exp%28%5Clambda%29%0A%0A%0A%0A%0A%0A%0A%0A%0A "X \sim Exp(\lambda)" )

![P( X < 1) = 0.096](https://latex.codecogs.com/png.image?%5Cinline%20%5Cdpi%7B100%7DP%28%20X%20%3C%201%29%20%3D%200.096%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A "P( X < 1) = 0.096" )

The answer to the question of what is the probability of a randomly chosen PC video card failing after two years of use expressed mathematically is:

![P( X > 2) = ?](https://latex.codecogs.com/png.image?%5Cinline%20%5Cdpi%7B100%7DP%28%20X%20%3E%202%29%20%3D%20%3F%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A "P( X > 2) = ?")

In order to obtain the probability, we must calculate the λ value and we know that the probability distribution is given by:

![F(x) = 1 - e\^{-\\lambda x}](https://latex.codecogs.com/png.image?%5Cinline%20%5Cdpi%7B100%7DF%28x%29%20%3D%201%20-%20e%5E%7B-%5Clambda%20x%7D%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A "F(x) = 1 - e^{-\lambda x}" )

![P(x < 1) = 1 - e^{-\\lambda * 1} = 0.096](https://latex.codecogs.com/png.image?%5Cinline%20%5Cdpi%7B100%7DP%28x%20%3C%201%29%20%3D%201%20-%20e%5E%7B-%5Clambda%20%2A%201%7D%20%3D%200.096%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A "P(x < 1) = 1 - e^{-\lambda * 1} = 0.096" )

Clearing we have:

![1 - 0.096 = e ^{-\\lambda}](https://latex.codecogs.com/png.image?%5Cinline%20%5Cdpi%7B100%7D1%20-%200.096%20%3D%20e%20%5E%7B-%5Clambda%7D%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A "1 - 0.096 = e ^{-\lambda}")

![0.904 = e ^{-\\lambda}](https://latex.codecogs.com/png.image?%5Cinline%20%5Cdpi%7B100%7D0.904%20%3D%20e%20%5E%7B-%5Clambda%7D%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A "0.904 = e ^{-\lambda}" )

To clear λ I must apply the natural logarithm to both sides of the equation

![\\ln 0904 = \\ln e\^{-\\lambda}](https://latex.codecogs.com/png.image?%5Cln%200904%20%3D%20%5Cln%20e%5E%7B-%5Clambda%7D%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A "\ln 0904 = \ln e^{-\lambda}")

-0.1 = -λ

λ = 0.1

Once we have the value of the parameter we can calculate the probability:

![P(x > 2) = 1 - P(x \\leq 2) = 1 - (1 - e\^{-\\lambda x}) = 1 - 1 + e\^{-0.1 * 2} = 0.8187](https://latex.codecogs.com/png.image?P%28x%20%3E%202%29%20%3D%201%20-%20P%28x%20%5Cleq%202%29%20%3D%201%20-%20%281%20-%20e%5E%7B-%5Clambda%20x%7D%29%20%3D%201%20-%201%20%2B%20e%5E%7B-0.1%20%2A%202%7D%20%3D%200.8187%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A "P(x > 2) = 1 - P(x \leq 2) = 1 - (1 - e^{-\lambda x}) = 1 - 1 + e^{-0.1 * 2} = 0.8187" )

We can already conclude that the probability of a business PC card failing after two years is 81.87%.

At a bank teller window, service times are exponentially distributed with an average of 2.5 minutes. Suppose a customer arrives at the bank teller window at 11:00 a.m., what is the probability that the customer will still be at the teller window after 11:04 a.m.?

![Bank teller window](_static/images/exponential-distribution/bank-teller-window.png)

X = The attention time measured in minutes

![X \\sim Exp(\\lambda)](https://latex.codecogs.com/png.image?%5Cinline%20%5Cdpi%7B100%7DX%20%5Csim%20Exp%28%5Clambda%29%0A%0A%0A%0A%0A%0A%0A%0A%0A "X \sim Exp(\lambda)" )

We know that the average value is 2.5 minutes and also that the mean is equal to the expected value, so:

![E(x) = \mu = 1 \/ \\lambda](https://latex.codecogs.com/png.image?%5Cinline%20%5Cdpi%7B100%7DE%28x%29%20%3D%20%5Cmu%20%3D%201%20%2F%20%5Clambda%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A "E(x) = \mu = 1 / \lambda" )

![\\lambda = 1\/\mu = 1\/2.5 = 0.4](https://latex.codecogs.com/png.image?%5Cinline%20%5Cdpi%7B100%7D%5Clambda%20%3D%201%2F%5Cmu%20%3D%201%2F2.5%20%3D%200.4%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A "\lambda = 1/\mu = 1/2.5 = 0.4" )

We must take into account that our variable is determined by the attention time expressed in minutes and if the client arrives at 11 in the morning, from that moment until 11:04 4 minutes have passed, so the probability that the client find in the window after four minutes have passed is:

![P(x \geq 4) = ?](https://latex.codecogs.com/png.image?%5Cinline%20%5Cdpi%7B100%7DP%28x%20%5Cgeq%204%29%20%3D%20%3F%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A "P(x \geq 4) = ?" )

Recall that the probability distribution function will always be equal to `P(X ≤ x)`. But in this case, as well as many others that we have seen before, we need to know when the variable is greater than or equal to a certain value. That is why we must use the complement of the probability that is:

![P(x \geq 4) = 1 - P(x < 4) = 1 - F(x) = 1 - (1 - e^{-\lambda * 1}) = 1 - (1 - e^{-0.4*4}) = 0.2019](https://latex.codecogs.com/png.image?P%28x%20%5Cgeq%204%29%20%3D%201%20-%20P%28x%20%3C%204%29%20%3D%201%20-%20F%28x%29%20%3D%201%20-%20%281%20-%20e%5E%7B-%5Clambda%20%2A%201%7D%29%20%3D%201%20-%20%281%20-%20e%5E%7B-0.4%2A4%7D%29%20%3D%200.2019%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A "P(x \geq 4) = 1 - P(x < 4) = 1 - F(x) = 1 - (1 - e^{-\lambda * 1}) = 1 - (1 - e^{-0.4*4}) = 0.2019" )

We can then conclude that the probability that a customer arrives at 11 in the morning and is at the window after 11:04 is 20.19%.
