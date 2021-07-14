# Markov Chains

The number of people that make up a population is determined both by the number of births and the probability that individuals have of dying within this population. For this, it is important to know the ages of the people that make up the population under study, that is, how the individuals are divided according to their age and also to know their probabilities with respect to fertility, mortality and survival. Then it will be necessary to make what we call a life table where the number of females that can mate is reflected first, to know the fertility terms of that publication.

It is then when we must use a classical probabilistic model based on matrix algebra, such as Markov chains, we are now going to explain what these chains consist of.

We are going to suppose that we toss a coin and we will designate the event <img src="https://render.githubusercontent.com/render/math?math=E_1="> If it comes up heads and <img src="https://render.githubusercontent.com/render/math?math=E_2="> If it comes up tails, but it does not matter if we repeat this action t times, the probability of obtaining <img src="https://render.githubusercontent.com/render/math?math=E_2"> will not depend on what has come up in the previous event, since both events are independent. But there are many other events that are represented by independent variables and in 1907 Marcov dedicated himself to studying these situations where an event will depend on the immediately preceding event and that is precisely what we will see in this article.

Suppose again that we have a sequence of “n” experiments or tests and in each of them we obtain a set of possible results, which we will consider finite and also designate by <img src="https://render.githubusercontent.com/render/math?math=E_1">, <img src="https://render.githubusercontent.com/render/math?math=E_2">, <img src="https://render.githubusercontent.com/render/math?math=E_3">, … <img src="https://render.githubusercontent.com/render/math?math=E_m">  Being between them, mutually exclusive. When we carry out an experiment and obtain the result <img src="https://render.githubusercontent.com/render/math?math=E_i">, then we can say that the system is in the state E_i, but we will use <img src="https://render.githubusercontent.com/render/math?math=E_i^t"> as the representation of the event <img src="https://render.githubusercontent.com/render/math?math=E_i"> but after t amount of tests. Therefore its probability will be given by <img src="https://render.githubusercontent.com/render/math?math=P\left\lfloor E_i^t\right\rfloor"> After t experiences that the system is in state <img src="https://render.githubusercontent.com/render/math?math=E_i">.

On the other hand, we will call <img src="https://render.githubusercontent.com/render/math?math=P_{ij}^t"> the probability of the system is in state <img src="https://render.githubusercontent.com/render/math?math=E_i"> but this time when the test t is conditioned to a previous test t - 1 and it is what we will call a state <img src="https://render.githubusercontent.com/render/math?math=E_j">, therefore:

<img src="https://render.githubusercontent.com/render/math?math=P_{ij}^t =P\left\lceil E_i^{t\ }/\ E_j^{t-1}\right\rceil">

However, when we have a succession of events <img src="https://render.githubusercontent.com/render/math?math=E_1, E_2, E_3,...E_m"> that are also mutually exclusive, that is when a Markov chain is constituted:

<img src="https://render.githubusercontent.com/render/math?math=P_{ij}^t =P\left\lceil E_i^{t\ }/\ E_j^{t-1}\right\rceil=\ P\left\lceil{\ E_i^{t\ }/E}_j^{t-1}.E_{j\ t-2}^{t-2}\ \ .E_{j\ t-3\ }^{t-3}\ldots E_{j1}^1.E_{j0}^0\ \right\rceil"> for all i, j = 1,2,…, m

This means that the probability that the object in the test t is in the state <img src="https://render.githubusercontent.com/render/math?math=E_i">, will only depend on the state <img src="https://render.githubusercontent.com/render/math?math=E_j">, of the previous test t-1 and that it is also independent of the previous tests or experiments. Somehow it is as if the system lacks "memory".

The probability <img src="https://render.githubusercontent.com/render/math?math=P_{ij}^t"> is evident that it depends on 3 variables that are: the events <img src="https://render.githubusercontent.com/render/math?math=E_i">, <img src="https://render.githubusercontent.com/render/math?math=E_j"> and the time “t”, therefore:

<img src="https://render.githubusercontent.com/render/math?math=P_{ij}^t =P\left\lceil E_i^{t\ }/\ E_j^{t-1}\right\rceil\neq P_{ij}^t'">

For the particular case where the probability <img src="https://render.githubusercontent.com/render/math?math=P_{ij}^t">  is independent of t, we can say that the Markov chain is stationary or homogeneous, in that case we can say that: <img src="https://render.githubusercontent.com/render/math?math=P_{ij}^t=\ P_{ij}">. So from now on we will consider the homogeneous chains as <img src="https://render.githubusercontent.com/render/math?math=P_{ij}"> is a certain probability that meets:

1. <img src="https://render.githubusercontent.com/render/math?math=P_{ij}\geq0">
2. <img src="https://render.githubusercontent.com/render/math?math=\sum_{i=1}^{m}{P_{ij}=1}">
3. <img src="https://render.githubusercontent.com/render/math?math=i,j \epsilon\ {1, 2,..., m}">

## Stochastic matrices

Stochastic matrices or also called probability matrices, are those that meet the condition that each of their rows ends up being a probability vector. It is important to emphasize that stochastic matrices are a case of Minkowski matrices, which in turn are also a specific case of non-negative matrices.

Now, a stochastic or probability vector is the one that fulfills that all its components are particularly non-negative and also the sum of them is always equal to 1, that is, given the case that <img src="https://render.githubusercontent.com/render/math?math=p\ =\ \left(p_{1\ },\ p_{2\ ,\ \ \ \ }\ldots,\ p_n\right)"> is a probability vector, then:

1. <img src="https://render.githubusercontent.com/render/math?math=p_{i\ \geq\ 0\ \ }para todo i= 1, 2,..., n">
2. <img src="https://render.githubusercontent.com/render/math?math=\sum_{i=1}^{n}p_i">

Given these circumstances, stochastic matrices are a particular case of what we call Minkowski matrices, let's define the latter, Monkowski matrices are non-negative and square matrices, where the condition that the sum of their elements is either from each column or each row, are less than or equal to the unit, therefore, if <img src="https://render.githubusercontent.com/render/math?math=A=\ \left[a_{ij}\right]_{nxn}"> is a Minkowski matrix, then it must be satisfied that:

1. <img src="https://render.githubusercontent.com/render/math?math=a_{ij\ }\geq0  para todo i = 1, 2, ..., n  y para todo j ) 1, 2, ..., n">
2. <img src="https://render.githubusercontent.com/render/math?math=\sum_{i=1}^{n}a_{ij}\le1">

Non-negative matrices: As their name indicates, they are those matrices made up of non-negative elements, so that if <img src="https://render.githubusercontent.com/render/math?math=A=\ \left[a_{ij}\right]_{nxn}"> is a non-negative matrix, then it must be true that:

1. <img src="https://render.githubusercontent.com/render/math?math=a_{ij\ }\geq0  para todo i = 1, 2,..., n  y para todo j ) 1, 2,..., n">

## State diagrams

We can represent the different relationships that exist between the states of a Markov chain through a diagram made up of nodes and arrows that are oriented by the transition probabilities and this type of diagram is known as state or transition diagrams.

Let's suppose that we have a stochastic matrix such as:

<img src="https://render.githubusercontent.com/render/math?math=A%20%3D%20%5Cleft(%5Cbegin%7Bmatrix%7D%5Cfrac%7B1%7D%7B2%7D%260%26%5Cfrac%7B1%7D%7B3%7D%5C%5C0%261%26%5Cfrac%7B2%7D%7B3%7D%5C%5C%5Cfrac%7B1%7D%7B2%7D%260%260%5C%5C%5Cend%7Bmatrix%7D%5Cright)">

The corresponding state diagram would be:

![diagram](_static/images/markov/image1.png)

Now let's go with an example: A pet store sells fish and has a guarantee, so if you buy a fish and it dies before three months, the store replaces the fish for free, yes, once the fish has been replaced once, the warranty is terminated.

We also have the following data:

1. During the first month 3% of the fish die
2. Between the first and second month, 5% of the fish die
3. Between the second and third month, 7% of the fish die

Let's represent the pet store situation using a Markov chain state diagram:
The nomenclature used will be the following:

1. <img src="https://render.githubusercontent.com/render/math?math=E_i="> Fish
2. The months will be i = 1, 2, 3 of guarantee
3. <img src="https://render.githubusercontent.com/render/math?math=E_4="> Fish that has been replaced and therefore no longer has the guarantee
4. <img src="https://render.githubusercontent.com/render/math?math=E_5"> Fish without warra
5. nty for having been sold more than 3 months ago

We are going to make the state diagram

![state_diagram](_static/images/markov/image2.png)

## Markov regular chains

Let us remember that until now we have considered a finite number of experiments, but it is not interesting to develop in a similar way for a long-term behavior, since the transition matrix solves the problem of finding the probability law. In the new proposed case, that is, to use the Markov chain but studying a long-term behavior, we must find the limit of the chain when time tends to infinity.

Being A^n\ the nth power of the transition matrix A, we can then say that:

<img src="https://render.githubusercontent.com/render/math?math=P\left[{E_i^n}/{E_j^0}\right] = A^n(i,j)">

If we have any two values i, j = {1, 2,…, m} using the induction method we have:

<img src="https://render.githubusercontent.com/render/math?math=P\left[{E_i^1}/{E_j^0}\right] = P_{ij}=A(i,j)">

Let's now suppose that the theorem is true for n-1, we can say that:

<img src="https://render.githubusercontent.com/render/math?math=P\left[{E_i^{n-1}}/{E_j^0}\right] = A^{n-1}(i,j)">

Using the law of total probability we have that:

<img src="https://render.githubusercontent.com/render/math?math=P\left[{E_i^n}/{E_j^0}\right]=\ \sum_{k=1}^{m}P\left[{E_i^{n-1}}/{E_j^0}\right]P\left[{E_i^n}/{E_j^{n-1}.\ E_j^0}\right]">

If we use the induction hypothesis:

<img src="https://render.githubusercontent.com/render/math?math=P\left[{E_i^{n-1}}/{E_j^0}\right] = A^{n-1}(i,j)">

In addition to the definition of the Markov Chain

<img src="https://render.githubusercontent.com/render/math?math=P\left[{E_i^n}/{E_j^{n-1}.\ E_j^0}\right]=P\left[{E_i^n}/{E_{jk}^{n-1}}\right]=\ P_{ik}=A(1,k)">

We can say then that:

<img src="https://render.githubusercontent.com/render/math?math=P\left[{E_i^n}/{E_j^0}\right]=\ \sum_{k=1}^{m}{A\ \left(i,k\right)A^{n-1}(k,j)}">

This corresponds to row i column j when we obtain the product of the matrices

<img src="https://render.githubusercontent.com/render/math?math=A\ A^{n-1}=\ A^n">

Let's see graphically how to recognize if a Markov chain is regular or not:

![regular_chain](_static/images/markov/image3.png)

This Markov chain is not regular because it only has one cycle

![cycle](_static/images/markov/image4.png)

This Markov chain is also not regular because both state E1 and state E3 do not have access from any other state

![not_regular](_static/images/markov/image5.png)

This Markov Chain is regular, since all its states are accessible.

Let's go with an example: suppose a company has three trucking centers that are located in Brisbane, Sydney and Melbourne. Every month, half of the trucks in Brisbane and Sydney go to Melbourne, while the other half stay at the same site. However, the trucks found in Melbourne are divided equally between Brisbane and Sydney. If initially the company had 100 trucks in Brisbane, 300 in Sydney and 200 in Melbourne, we want to know the distribution of trucks after the first month and after two months in each of the cities.

The first thing we must do is make the state diagram:

![diagram](_static/images/markov/image6.png)

The nomenclature will be as follows:

<img src="https://render.githubusercontent.com/render/math?math=B_K"> Number of trucks in Brisbane, <img src="https://render.githubusercontent.com/render/math?math=S_K"> number of trucks in Sydney and <img src="https://render.githubusercontent.com/render/math?math=M_K"> number of trucks in Melbourne after k months.

For the first month we have to:

<img src="https://render.githubusercontent.com/render/math?math=B_1=\ \frac{1}{2}B_0"> +<img src="https://render.githubusercontent.com/render/math?math=\ \frac{1}{2}M_0 ="> 50 + 100 = 150

<img src="https://render.githubusercontent.com/render/math?math=M_1=\ \frac{1}{2}B_0"> +<img src="https://render.githubusercontent.com/render/math?math=\ \frac{1}{2}S_0="> 50 + 150=200

<img src="https://render.githubusercontent.com/render/math?math=S_1=\ \frac{1}{2}S_0"> +<img src="https://render.githubusercontent.com/render/math?math=\ \frac{1}{2}M_0="> 150 + 100 = 250

For the second month the distribution of trucks will be:

<img src="https://render.githubusercontent.com/render/math?math=B_2=\ \frac{1}{2}B_1"> +<img src="https://render.githubusercontent.com/render/math?math=\ \frac{1}{2}M_1="> 75+100=175

<img src="https://render.githubusercontent.com/render/math?math=M_2=\ \frac{1}{2}B_1"> +<img src="https://render.githubusercontent.com/render/math?math=\ \frac{1}{2}S_1="> 75+125=200

<img src="https://render.githubusercontent.com/render/math?math=S_2=\ \frac{1}{2}S_1"> +<img src="https://render.githubusercontent.com/render/math?math=\ \frac{1}{2}M_1="> 125+100=225

We can perform these same calculations in a more convenient way, using matrix notation. We are going to call <img src="https://render.githubusercontent.com/render/math?math=X_K"> the vector that represents the probabilities in month K, then the denotation would be:

<img src="https://render.githubusercontent.com/render/math?math=X_K=\ \left[\begin{matrix}B_K\\M_K\\S_K\\\end{matrix}\right]">

The calculation for the first month can be represented in a matrix as follows:

<img src="https://render.githubusercontent.com/render/math?math=X_1=\ \left[\begin{matrix}B_1\\M_1\\S_1\end{matrix}\right]"> <img src="https://render.githubusercontent.com/render/math?math=%3D%5Cleft%5B%5Cbegin%7Bmatrix%7D1%2F2%261%2F2%260%20%5C%5C%201%2F2%260%261%2F2%20%5C%5C%200%261%2F2%261%2F2%20%5Cend%7Bmatrix%7D%5Cright%5D"> <img src="https://render.githubusercontent.com/render/math?math=\left[\begin{matrix}B_0\\M_0\\S_0\end{matrix}\right]">

Then yes:

<img src="https://render.githubusercontent.com/render/math?math=P%3D%5C%0A%5Cleft%5B%5Cbegin%7Bmatrix%7D1%2F2%261%2F2%260%5C%5C1%2F2%260%261%2F2%5C%5C0%261%2F2%261%2F2%5C%5C%5Cend%7Bmatrix%7D%5Cright%5D">

We can express the above equation as: <img src="https://render.githubusercontent.com/render/math?math=X_1=\ P_{X_0}">

So as:

<img src="https://render.githubusercontent.com/render/math?math=X_2=\ P_{X_1}=\ P_{X_0}^2">

Therefore:

<img src="https://render.githubusercontent.com/render/math?math=X_2%3D%5C%20%5Cleft%5B%5Cbegin%7Bmatrix%7D1%2F2%261%2F2%260%5C%5C1%2F2%260%261%2F2%5C%5C0%261%2F2%261%2F2%5C%5C%5Cend%7Bmatrix%7D%5Cright%5D"> <img src="https://render.githubusercontent.com/render/math?math=%5Cleft%5B%5Cbegin%7Bmatrix%7D1%2F2%261%2F2%260%5C%5C1%2F2%260%261%2F2%5C%5C0%261%2F2%261%2F2%5C%5C%5Cend%7Bmatrix%7D%5Cright%5D"> <img src="https://render.githubusercontent.com/render/math?math=%5Cleft%5B%5Cbegin%7Bmatrix%7D100%5C%5C200%5C%5C300%5C%5C%5Cend%7Bmatrix%7D%5Cright%5D">

<img src="https://render.githubusercontent.com/render/math?math=X_2%3D%5C%20%5Cleft%5B%5Cbegin%7Bmatrix%7D1%2F2%261%2F4%261%2F4%5C%5C1%2F4%261%2F2%261%2F4%5C%5C1%2F4%261%2F4%261%2F2%5C%5C%5Cend%7Bmatrix%7D%5Cright%5D"> <img src="https://render.githubusercontent.com/render/math?math=%5Cleft%5B%5Cbegin%7Bmatrix%7D100%5C%5C200%5C%5C300%5C%5C%5Cend%7Bmatrix%7D%5Cright%5D"> <img src="https://render.githubusercontent.com/render/math?math=%3D%5Cleft%5B%5Cbegin%7Bmatrix%7D175%5C%5C200%5C%5C225%5C%5C%5Cend%7Bmatrix%7D%5Cright%5D">

To generalize, we can express the equation as follows:

<img src="https://render.githubusercontent.com/render/math?math=X_K%20%3D%20PX_%7Bk-1%7D%20%3D%20P_%7BX_%7Bk-2%7D%7D%5E2%3D%5Cldots%3D%5C%20P_%7BX_0%7D%5EK">

We can conclude that a Markov chain is finite and comes from an evolutionary process of a finite number of states, which we can denote as:
State 1, State 2, State 3,…, State n. For each point in time, the process will be in one of the states and already changing state by means of fixed probabilities, which are what we call transition probabilities.

Therefore, there is a vector <img src="https://render.githubusercontent.com/render/math?math=X_K"> for each time k and represents the probability of being in the different states for a time K, that is:

<img src="https://render.githubusercontent.com/render/math?math=X_K%3DP_%7BX_0%7D%5EK">

Let's go to an illustrative example:

The department in charge of market research for a certain factory has estimated that 20% of the people who buy the manufactured product one month will not buy it the next month. They have also determined that those people who do not buy the product one month will buy it the next month. If out of a population of 1000 people, 100 of them buy the product the first month, how many people will buy the product next month? How many people will buy it two months later?

Of the 100% of people who buy the product in one month, 20% will not buy it the following month, that is, 80% will continue to buy it the following month and in the same way 100% of people who do not buy it in one month, only 30% will buy it the following month, so 70% will not buy the product.

As always, we will make the state diagram

![state_diagram](_static/images/markov/image7.png)

| | People buy the product |People do not buy the product|
| ----------- | ----------- | ----------- |
| People buy the product|0.8|0.30|
| People do not buy the product|0.20|0.70|

Our transition matrix will then be:

<img src="https://render.githubusercontent.com/render/math?math=P%3D%5C%20%5Cleft%5B%5Cbegin%7Bmatrix%7D0.8%260.30%5C%5C0.2%260.70%5C%5C%5Cend%7Bmatrix%7D%5Cright%5D">

In the initial state we know that out of 1000 people, 100 bought the product, so that 900 people did not buy the product, our initial vector will be:

<img src="https://render.githubusercontent.com/render/math?math=X_0%3D%5C%20%5Cleft%5B%5Cbegin%7Bmatrix%7D100%5C%5C900%5C%5C%5Cend%7Bmatrix%7D%5Cright%5D%0A">

<img src="https://render.githubusercontent.com/render/math?math=X_1%3D%5C%20P_%7BX_0%7D%5E1%3D%5C%20%5Cleft%5B%5Cbegin%7Bmatrix%7D0.8%260.30%5C%5C0.2%260.70%5C%5C%5Cend%7Bmatrix%7D%5Cright%5D"> <img src="https://render.githubusercontent.com/render/math?math=%5Cleft%5B%5Cbegin%7Bmatrix%7D100%5C%5C900%5C%5C%5Cend%7Bmatrix%7D%5Cright%5D">

<img src="https://render.githubusercontent.com/render/math?math=X_1%3D%5C%20%5Cleft%5B%5Cbegin%7Bmatrix%7D350%5C%5C650%5C%5C%5Cend%7Bmatrix%7D%5Cright%5D%0A">

For the first month 350 customers will buy the product, while 650 customers will not buy it.

<img src="https://render.githubusercontent.com/render/math?math=X_2%3D%5C%20P_%7BX_0%7D%5E2%3D%5C%20%5Cleft%5B%5Cbegin%7Bmatrix%7D0.8%260.30%5C%5C0.2%260.70%5C%5C%5Cend%7Bmatrix%7D%5Cright%5D"> <img src="https://render.githubusercontent.com/render/math?math=%5Cleft%5B%5Cbegin%7Bmatrix%7D0.8%260.30%5C%5C0.2%260.70%5C%5C%5Cend%7Bmatrix%7D%5Cright%5D"> <img src="https://render.githubusercontent.com/render/math?math=%5Cleft%5B%5Cbegin%7Bmatrix%7D100%5C%5C900%5C%5C%5Cend%7Bmatrix%7D%5Cright%5D">

<img src="https://render.githubusercontent.com/render/math?math=P%5E2%3D%5C%20%5Cleft%5B%5Cbegin%7Bmatrix%7D0.7%260.45%5C%5C0.3%260.55%5C%5C%5Cend%7Bmatrix%7D%5Cright%5D">

<img src="https://render.githubusercontent.com/render/math?math=X_2%3D%5C%20P_%7BX_0%7D%5E2%3D%5Cleft%5B%5Cbegin%7Bmatrix%7D0.7%260.45%5C%5C0.3%260.55%5C%5C%5Cend%7Bmatrix%7D%5Cright%5D"> <img src="https://render.githubusercontent.com/render/math?math=%5Cleft%5B%5Cbegin%7Bmatrix%7D100%5C%5C900%5C%5C%5Cend%7Bmatrix%7D%5Cright%5D"><img src="https://render.githubusercontent.com/render/math?math=%3D%5Cleft%5B%5Cbegin%7Bmatrix%7D475%5C%5C525%5C%5C%5Cend%7Bmatrix%7D%5Cright%5D">

These calculations indicate that for the second month 475 customers will buy the product and 525 will not buy it.

Another example:

A student is taking math and physics courses this semester. The student decides to follow the following patterns when studying these subjects:

If one day she studies math, the next day she will spend 1/2 of her time studying math and the other 1/2 time studying physics.

If you study physics one day, the next day you will spend 2/3 of your time studying mathematics and the other 1/3 of your time studying physics.

If the student spends the Monday of a week studying physics, how likely is the student to spend his time on Thursday of the same week studying mathematics?

We are going to make the state diagram:

![state_diagram](_static/images/markov/image8.png)

In a Markov chain the important thing is to find:
1. The transition matrix
2. The initial state to find the transition matrix it is advisable to make a table

| | Math |Physics|
| ----------- | ----------- | ----------- |
| Math|1/2|2/3|
| Physics|1/2|1/3|

So from there we can write the transition matrix:

<img src="https://render.githubusercontent.com/render/math?math=P%3D%5C%20%5Cleft%5B%5Cbegin%7Bmatrix%7D1%2F2%262%2F3%5C%5C1%2F2%261%2F3%5C%5C%5Cend%7Bmatrix%7D%5Cright%5D">

We can then verify that this matrix is stochastic, since it is made up of probability vectors, we know that they are probability vectors because their elements are greater than or equal to zero and when adding their components, the result is unity. When I add 1/2 + 1/2 = 1 and in the same way 2/3 + 1/3 = 1.

We are now going to find the vector that represents the initial state, for this the established order is important, that is, in our table we place mathematics first and then physics. Now, the question we must answer in the problem begins with the statement "If one day he studies physics", so that is where our initial state begins. This implies that that day he studied physics and not mathematics, therefore our initial vector will be given by a null time dedicated to the study of mathematics and the total time studying physics, that is:

<img src="https://render.githubusercontent.com/render/math?math=X_0%3D%5C%20%5Cleft%5B%5Cbegin%7Bmatrix%7D0%5C%5C1%5C%5C%5Cend%7Bmatrix%7D%5Cright%5D%0A">

Once we have the transition matrix and the initial state, we can answer the question posed. As we know, our initial day is Monday and we assign a value of K = 0 to that day, therefore, for Tuesday K = 1, Wednesday K = 2 and we are specifically interested in Thursday when K = 3. Remembering the formula what interests us:

<img src="https://render.githubusercontent.com/render/math?math=X_K%3DP_%7BX_0%7D%5EK%0A">

Therefore:

<img src="https://render.githubusercontent.com/render/math?math=X_3%3DP_%7BX_0%7D%5E3%0A">

<img src="https://render.githubusercontent.com/render/math?math=X_3%3D%20%5Cleft%5B%5Cbegin%7Bmatrix%7D1%2F2%262%2F3%5C%5C1%2F2%261%2F3%5C%5C%5Cend%7Bmatrix%7D%5Cright%5D%5E3"><img src="https://render.githubusercontent.com/render/math?math=%5Cleft%5B%5Cbegin%7Bmatrix%7D0%5C%5C1%5C%5C%5Cend%7Bmatrix%7D%5Cright%5D">

<img src="https://render.githubusercontent.com/render/math?math=X_3%3D%5Cleft%5B%5Cbegin%7Bmatrix%7D1%2F2%262%2F3%5C%5C1%2F2%261%2F3%5C%5C%5Cend%7Bmatrix%7D%5Cright%5D"><img src="https://render.githubusercontent.com/render/math?math=%5Cleft%5B%5Cbegin%7Bmatrix%7D1%2F2%262%2F3%5C%5C1%2F2%261%2F3%5C%5C%5Cend%7Bmatrix%7D%5Cright%5D"><img src="https://render.githubusercontent.com/render/math?math=%5Cleft%5B%5Cbegin%7Bmatrix%7D1%2F2%262%2F3%5C%5C1%2F2%261%2F3%5C%5C%5Cend%7Bmatrix%7D%5Cright%5D"><img src="https://render.githubusercontent.com/render/math?math=%5Cleft%5B%5Cbegin%7Bmatrix%7D0%5C%5C1%5C%5C%5Cend%7Bmatrix%7D%5Cright%5D">

<img src="https://render.githubusercontent.com/render/math?math=X_3%3D%5Cleft%5B%5Cbegin%7Bmatrix%7D41%2F72%2631%2F54%5C%5C31%2F72%2623%2F54%5C%5C%5Cend%7Bmatrix%7D%5Cright%5D"><img src="https://render.githubusercontent.com/render/math?math=%5Cleft%5B%5Cbegin%7Bmatrix%7D0%5C%5C1%5C%5C%5Cend%7Bmatrix%7D%5Cright%5D">

<img src="https://render.githubusercontent.com/render/math?math=X_3%3D%5C%20%5Cleft%5B%5Cbegin%7Bmatrix%7D31%2F54%5C%5C23%2F54%5C%5C%5Cend%7Bmatrix%7D%5Cright%5D%0A">

<img src="https://render.githubusercontent.com/render/math?math=X_3%3D%5Cleft%5B%5Cbegin%7Bmatrix%7D0.5741%5C%5C0.4259%5C%5C%5Cend%7Bmatrix%7D%5Cright%5D%0A">

We already calculated the study probabilities for Thursday, but the question is how much study time he will dedicate to mathematics, as we know that subject is the first one we place in our vector, therefore, the probabilistic study time of mathematics for Thursday it will be 57.41% of your time.
