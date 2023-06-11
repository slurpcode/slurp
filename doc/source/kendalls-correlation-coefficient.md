# 🧮 Kendall's correlation coefficient for repeating variables

## Normal Distribution

In the previous article, we stated that one of the conditions to be able to implement Pearson's correlation coefficient is that the variables involved must have a normal distribution, otherwise, it is necessary to change the method to use Spearman's or Kendall's.

So what is a normal distribution? It is when the distribution of the function is symmetric, but the value of the mean, median and mode also coincide, that is, these three values are equal.

When it comes to graphing the function whose distribution is normal, we are left with a graph like the Gaussian bell. On the other hand, the most frequent values are around the mean and as we move away from this value, the frequency decreases.

Let's go with a simple example, we have a variable (x) that has the following data:

| (x) |
| --- |
| 1   |
| 1,5 |
| 2   |
| 3   |
| 3,5 |
| 4   |
| 4,5 |
| 5   |
| 5,5 |
| 6   |
| 6,5 |
| 7   |

We introduce these values in Excel and to find the distribution of the function we must have the standard deviation and the median. To do this, we simply go to "Data" → "Data Analysis" → "Descriptive Statistics" and a window opens, where we must place in the input range all the values that make up the column of our variable (x), We must also check the box of the output range and in it, we position ourselves on any cell, which is where we want the result of the analysis to be shown, finally, we simply click on OK and a table will appear with the required data, even with other descriptive statistics data that may be of interest to us.

Now we go to the column next to (x), we identify it as F (x) and in the first row of data we assign the following instruction:
= NORM.DIST (we choose the cell where the first value of x is found; the cell that contains the mean value; the same with the standard deviation; 0)

Thus we obtain the first value of our normal distribution, now we must place the "$" symbol before and after the letter that represents the cell of both the mean and the standard deviation, since as we know they are values that will remain constant. Later, we drag that value to the last row, to generate the subsequent numbers and thus we can complete the data of our normal distribution.

Then we choose both columns, we go to `"Insert" → "Dispersion" → "Dispersion with smooth lines" → Ok.`

In this way we obtain our graph, which as we can see, is symmetric and looks like the Gaussian bell, we can also notice that the mean and median are equal, in this case, the mode "Does not apply" since it is the value most repeated and all the values of (x), in this case, are different.

If we follow this method with the data that our sample gives us, we can know if we are in the presence of a normal distribution or not and thus have an idea of what type of method we should use, when it comes to finding the correlation coefficient.

## Kendall's correlation coefficient with equal variables

In the previous article, the last exercise we did, we learned to use Kendall's correlation coefficient to know the relationship between a pair of variables, but where each of the variables was different from all the others. Now we are going to explain how the Kendall correlation coefficient is used, when there are some variables that coincide or are equal to each other.

The procedure to calculate the concordant and discordant values is the same as for the last exercise that we carried out in the previous article. However, when calculating the Kendall correlation for values that include equal elements, the equation is different and I present it below:

`τ=S/(√(1/2 N(N-1)-Tx)*√(1/2 N(N-1)-Ty))`

In the same way τ remains the Kendall correlation coefficient, N is the number of observations in pairs of variables and “S” is the difference of the sum between the concordant and discordant pairs.

But now we have two new terms that are Tx and Ty, where Tx is the adjustment of the values that are repeated in the variable (x) and in the same way Ty, is the adjustment of the values in (y).

In the previous article we explained in detail how the value of S is calculated and N is the number of our observations, we just need to clarify how Tx and Ty are found.

`Tx = 1/2 ∑▒〖t(t-1)〗,` where (t) is the number of times a value is repeated in the variable (x).

`Ty = 1/2 ∑▒〖t(t-1)〗,` in the same way as for Tx, is the number of times a value is repeated in the variable (y). It seems to us that the best thing is to make an example, so that you can visualize it in a more expeditious way.

**Example 1:**

We have the blood pressure data of 15 people of different ages, to assign the blood pressure ranges, we are based on a table that indicates the blood pressure that is considered healthy according to the age of the people, in this way we can set three ranges of blood pressure: low, medium and high, so we will list them from 1 to 3, respectively.

| Blood pressure |     |
| -------------- | --- |
| Low            | 1   |
| Mid            | 2   |
| High           | 3   |

Of course, the older you get, your blood pressure tends to be even higher at normal levels. So we expect the Kendall coefficient to be positive, since the older the blood pressure is, the higher it is. On the other hand, we will also assign three different ranges according to age:

| Age Range  |     |
| ---------- | --- |
| 0-19       | 1   |
| 20-39      | 2   |
| 40 or more | 3   |

According to these ranges, the following results were obtained:

| Age | Blood Pressure |
| --- | -------------- |
| 2   | 2              |
| 2   | 2              |
| 2   | 2              |
| 3   | 3              |
| 2   | 2              |
| 1   | 1              |
| 3   | 3              |
| 2   | 2              |
| 2   | 2              |
| 1   | 1              |
| 3   | 3              |
| 2   | 3              |
| 3   | 3              |
| 3   | 2              |

The first thing we are going to do is order the independent variable age from lowest to highest and assign the range (x) a value from 1 to N (In this case N=15) to accompany the previously ordered variable (x).

We should notice that the values of the ranges are repeated and that changes the correlation method.

| Rank(x) | Age |
| ------- | --- |
| 1       | 1   |
| 2       | 1   |
| 3       | 2   |
| 4       | 2   |
| 5       | 2   |
| 6       | 2   |
| 7       | 2   |
| 8       | 2   |
| 9       | 2   |
| 10      | 2   |
| 11      | 3   |
| 12      | 3   |
| 13      | 3   |
| 14      | 3   |
| 15      | 3   |

We must now make a table where the age range is specified, what positions that range occupies in the previous table, for example: how can you observe the age range 1 occupies positions 1 and 2, it is repeated twice that is our value from (t), if we add the positions that are 1 + 2 = 3, we can obtain the data in the table that correspond to the sum of positions.

| Age Range | Positions          | Amount Of Repetitions(t) | Sum Of Positions | Assigned Rank | t(t-1) |
| --------- | ------------------ | ------------------------ | ---------------- | ------------- | ------ | --- |
| 1         | 1 y 2              | 2                        | 3                | 1,5           | 2      |
| 2         | 3,4,5,6,7,8,9 y 10 | 8                        | 52               | 6,5           | 56     |
| 3         | 11,12,13,14 y 15   | 5                        | 65               | 13            | 20     |
|           |                    |                          |                  |               | Sum    | 78  |

To obtain the assigned range we must divide the sum of positions by the number of repetitions, in the first row we can observe `3/2 = 1.5` and the last column we obtain it with the value of the number of repetitions (t), with the formula `t (t - 1)` and in this case it is `2 (2-1) = 2`.

We repeat this procedure for the rest of the age ranges, if we consider range 2, we will find it in positions `3, 4, 5, 6, 7, 8, 9 and 10`, this range is repeated 8 times, the sum of the positions is: `3 + 4 + 5 + 6 + 7 + 8 + 9 + 10 = 52`. The assigned range will be `52/8 = 6.5` and the value of `t = 8 so t (t - 1) = 8 (8 - 1) = 56.`

We will have to repeat the same procedure for rank 3. Once the table is completed we can find Tx

`Tx = 1/2 ∑▒〖t(t-1)〗 = 78/2 = 39`

Now we will repeat the entire previous process, but this time for blood pressure, that is, we will order the blood pressure range from lowest to highest and we will give values to the range (y) from 1 to 15, yes, after ordering the variable, so we will have the following tables:

| Blood Pressure | Rank(y) |
| -------------- | ------- |
| 1              | 1       |
| 1              | 2       |
| 2              | 3       |
| 2              | 4       |
| 2              | 5       |
| 2              | 6       |
| 2              | 7       |
| 2              | 8       |
| 2              | 9       |
| 3              | 10      |
| 3              | 11      |
| 3              | 12      |
| 3              | 13      |
| 3              | 14      |
| 3              | 15      |

| Blood Pressure Range | Positions           | Amount Of Repetitions(t) | Sum Of Positions | Assigned Rank | t(t-1) |
| -------------------- | ------------------- | ------------------------ | ---------------- | ------------- | ------ | --- |
| 1                    | 1 y 2               | 2                        | 3                | 1.5           | 2      |
| 2                    | 3,4,5,6,7,8 y 9     | 8                        | 42               | 6             | 42     |
| 3                    | 10,11,12,13,14 y 15 | 6                        | 75               | 12.5          | 30     |
|                      |                     |                          |                  |               | Sum    | 74  |

We can then find `Ty = 1/2 ∑▒〖t(t-1)〗 = 74/2 = 37`

Now we will simply return to our initial table, only this time we will add two columns with the new ranges assigned for each of the variables, so that we will obtain a table as shown below:

| Original Value Age | Assigned Rank (x) | Original Value(Blood Pressure) | Assigned Rank(y) |
| ------------------ | ----------------- | ------------------------------ | ---------------- |
| 2                  | 6.5               | 2                              | 6                |
| 2                  | 6.5               | 2                              | 6                |
| 2                  | 6.5               | 2                              | 6                |
| 3                  | 13                | 3                              | 12.5             |
| 2                  | 6.5               | 2                              | 6                |
| 1                  | 1.5               | 1                              | 1.5              |
| 3                  | 13                | 3                              | 12.5             |
| 2                  | 6.5               | 2                              | 6                |
| 1                  | 1.5               | 1                              | 1.5              |
| 3                  | 13                | 3                              | 12.5             |
| 2                  | 6.5               | 2                              | 6                |
| 2                  | 6.5               | 2                              | 6                |
| 1                  | 1.5               | 1                              | 1.5              |
| 2                  | 6.5               | 3                              | 12.5             |
| 3                  | 13                | 3                              | 12.5             |
| 2                  | 6.5               | 3                              | 12.5             |
| 3                  | 13                | 3                              | 12.5             |
| 3                  | 13                | 2                              | 6                |

We are then going to look for the concordant and discordant pairs, for this we will join our ranges (x) and (y) with which we are going to work from now on:

| Assigned rank (x) | Assigned rank (y) |
| ----------------- | ----------------- |
| 6.5               | 6                 |
| 6.5               | 6                 |
| 6.5               | 6                 |
| 13                | 12.5              |
| 6.5               | 6                 |
| 1.5               | 1.5               |
| 13                | 12.5              |
| 6.5               | 6                 |
| 6.5               | 6                 |
| 1.5               | 1.5               |
| 6.5               | 12.5              |
| 13                | 12.5              |
| 6.5               | 12.5              |
| 13                | 12.5              |
| 13                | 6                 |

The data in the range (x) are ordered from smallest to largest, but so that it does not lose the order of its ordered pair, both columns must be selected go to "Data" → "Sort" → Choose variable range (x) → Choose the option "Sort from lowest to highest" and the range (x) will be ordered in this way, with its respective ordered pair and without losing the agreement. The table will be as follows:

| Row | Assigned Rank(x) | Assigned Rank(y) |
| --- | ---------------- | ---------------- |
| 1   | 1.5              | 1.5              |
| 2   | 1.5              | 1.5              |
| 3   | 6.5              | 6                |
| 4   | 6.5              | 6                |
| 5   | 6.5              | 6                |
| 6   | 6.5              | 6                |
| 7   | 6.5              | 6                |
| 8   | 6.5              | 6                |
| 9   | 6.5              | 12.5             |
| 10  | 6.5              | 12.5             |
| 11  | 13               | 6                |
| 12  | 13               | 12.5             |
| 13  | 13               | 12.5             |
| 14  | 13               | 12.5             |
| 15  | 13               | 12.5             |

Now we are going to look for the pairs of concordant and discordant coordinates, for this we will have to compare the first value with the value found in the lower cells. To find the concordant values, it must be satisfied that:

`x_i < x_j, but also that y_i < y_j`

Being x_i the value that we are considering at the moment and x_j the values that are in the subsequent cells, therefore, we must take into account all the values that are in the following lower cells x_j and that are greater than the cell that Let's consider x_i the same for y_i and y_j.

If we look at the first value, we realize that it is worth 1.5 for both (x) and (y), therefore from row 3 to row 15 all the values are greater than 1.5, therefore, the first is true condition x_i < x_j. But also all the values of those 13 rows, satisfy the condition y_i < y_j. In the same way, it happens for the second value of 1.5, so both have 13 matching pairs.

| Row | Assigned Rank(x) | Assigned Rank(y) | Matching Values |
| --- | ---------------- | ---------------- | --------------- |
| 1   | 1.5              | 1.5              | 13              |
| 2   | 1.5              | 1.5              | 13              |
| 3   | 6.5              | 6                | 4               |
| 4   | 6.5              | 6                | 4               |
| 5   | 6.5              | 6                | 4               |
| 6   | 6.5              | 6                | 4               |
| 7   | 6.5              | 6                | 4               |
| 8   | 6.5              | 6                | 4               |
| 9   | 6.5              | 12.5             | 0               |
| 10  | 6.5              | 12.5             | 0               |
| 11  | 13               | 6                | 0               |
| 12  | 13               | 12.5             | 0               |
| 13  | 13               | 12.5             | 0               |
| 14  | 13               | 12.5             | 0               |
| 15  | 13               | 12.5             | 0               |

Rows from 3 to 8 have 4 concordant possibilities, since we will have to compare their values and find those greater than 6.5 and 6 respectively, both for (x) and for (y), as both conditions must be met, these only It happens in the last four rows, where are the cells that contain the value of 13 > 6.5 and 12.5 > 6.

As we can see, this same condition is repeated from rows 3 to 8, so we can build a table of concordant values and from row 9 there are no concordant values.

We are now going to look for the discordant values and for this, the following two conditions must be met:

`x_i< x_j and also that y_i> y_j`

This implies that the subsequent values x_j to the considered value of x_i must be greater than this value, but the values of the lower cells y_j must be less than the considered value y_j. If we look at the table, from row 1 to 8, the values subsequent to x_i are indeed greater, but instead the values of the cells following y_i none of them are less than the values considered for these rows.

On the other hand, for rows 9 and 10, we can find that the values of x_j are greater than x_i in the following rows, however, for y_i there is only one smaller value that is found in row 11. So that meet both conditions, we only have one discordant value for both row 9 and row 10. The rest of the rows no longer have discordant values, so we can now generate a table of discordant values:

| Row | Assigned Rank(x) | Assigned Rank(y) | Matching Values | Discordant values |
| --- | ---------------- | ---------------- | --------------- | ----------------- |
| 1   | 1.5              | 1.5              | 13              | 0                 |
| 2   | 1.5              | 1.5              | 13              | 0                 |
| 3   | 6.5              | 6                | 4               | 0                 |
| 4   | 6.5              | 6                | 4               | 0                 |
| 5   | 6.5              | 6                | 4               | 0                 |
| 6   | 6.5              | 6                | 4               | 0                 |
| 7   | 6.5              | 6                | 4               | 0                 |
| 8   | 6.5              | 6                | 4               | 0                 |
| 9   | 6.5              | 12.5             | 0               | 1                 |
| 10  | 6.5              | 12.5             | 0               | 1                 |
| 11  | 13               | 6                | 0               | 0                 |
| 12  | 13               | 12.5             | 0               | 0                 |
| 13  | 13               | 12.5             | 0               | 0                 |
| 14  | 13               | 12.5             | 0               | 0                 |
| 15  | 13               | 12.5             | 0               | 0                 |
|     |                  | Sum              | 50              | 2                 |

We can already find S by subtracting the sum of the concordant values from the discordant ones: `S = 50 - 2 = 48`

The last step is simply to apply the formula to find Kendall's correlation coefficient:

`τ=S/(√(-1/2 N(N-1)-Tx)*√(-1/2 N(N-1)-Ty))`

Substituting the values, we have that:

`τ=48/(√(1/2 15(15-1)-39) √(1/2 15(15-1)-44)) = 0.757`

The result indicates that the Kendall correlation coefficient is positive, therefore, there is a positive or direct linear correlation between the variables blood pressure and age, with a weight and strength much closer to 1 than to 0, which indicates a medium to strong correlation between both variables, that is, as age increases, blood pressure also increases.

**Exercise 2:**

A certain researcher wants to know if the degree of collaboration that employees have in companies has something to do with their level of education. To see the correlation between these two variables, the researcher took as a sample 21 people who work in a factory and were classified as low, medium or high degree collaborators with the factory and then the files were requested to corroborate their level of instruction. it was observed that the levels oscillated between secondary, technical and university. So after qualifying he was able to get the following data:

| Level Of Instruction | Degree Of Collaboration |
| -------------------- | ----------------------- |
| Technical            | Medium                  |
| Academic             | Medium                  |
| Technical            | High                    |
| High School          | Low                     |
| High School          | Low                     |
| High School          | Low                     |
| High School          | Low                     |
| Academic             | Low                     |
| Academic             | Medium                  |
| High School          | Medium                  |
| Academic             | Low                     |
| Academic             | Medium                  |
| Academic             | High                    |
| Technical            | Medium                  |
| Technical            | High                    |
| Technical            | High                    |
| High School          | High                    |
| High School          | Medium                  |
| High School          | High                    |
| Technical            | High                    |
| Academic             | Medium                  |
| High School          | Low                     |

To make it easier to calculate Kendall's correlation coefficient, he gave each of those academic and collaborative grades a number, so he defined that:

Degree Of Collaboration

| Low    | 1   |
| ------ | --- |
| Medium | 2   |
| High   | 3   |

Academic Level

| High School | 1   |
| ----------- | --- |
| Technical   | 2   |
| Academic    | 3   |

So they substituted the values in the initial table:

| Level Of Instruction | Degree Of Collaboration |
| -------------------- | ----------------------- |
| 2                    | 2                       |
| 3                    | 2                       |
| 2                    | 3                       |
| 1                    | 1                       |
| 1                    | 1                       |
| 1                    | 1                       |
| 1                    | 1                       |
| 3                    | 1                       |
| 3                    | 2                       |
| 3                    | 3                       |
| 2                    | 2                       |
| 2                    | 3                       |
| 2                    | 3                       |
| 1                    | 3                       |
| 1                    | 2                       |
| 1                    | 3                       |
| 2                    | 3                       |
| 3                    | 2                       |
| 1                    | 1                       |

Again we must apply the method that we explained previously, to calculate the Kendall correlation coefficient.

To do this, we must take the independent variable (x), in this case it is the level of instruction and we are going to order it from lowest to highest in Excel, but also, once ordered, we are going to generate the range (x) with numbers from the 1 to N, as we know, for this particular example N = 22, so we are left with a table as follows:

| Degree Of Collaboration | Rank(x) |
| ----------------------- | ------- |
| 1                       | 1       |
| 1                       | 2       |
| 1                       | 3       |
| 1                       | 4       |
| 1                       | 5       |
| 1                       | 6       |
| 2                       | 7       |
| 2                       | 8       |
| 2                       | 9       |
| 2                       | 10      |
| 2                       | 11      |
| 2                       | 12      |
| 2                       | 13      |
| 2                       | 14      |
| 3                       | 15      |
| 3                       | 16      |
| 3                       | 17      |
| 3                       | 18      |
| 3                       | 19      |
| 3                       | 20      |
| 3                       | 21      |

Again we must make a table that includes the number of the row where the value is repeated, the number of repetitions of each value (t), the sum of the positions in the rows where the repeated value is found, the assigned range and the last column represents at `(t - 1)`, so we get a table as shown below:

| Range Of Collaborators | Positions                    | Amount Of Repetitions(t) | Sum of Positions | Assigned Rank | t(t-1) |
| ---------------------- | ---------------------------- | ------------------------ | ---------------- | ------------- | ------ |
| 1                      | 1, 2, 3, 4, 5 y 6            | 6                        | 21               | 3,5           | 30     |
| 2                      | 7, 8, 9, 10, 11, 12, 13 y 14 | 8                        | 84               | 10,5          | 56     |
| 3                      | 15, 16, 17, 18, 19, 20 y 21  | 7                        | 126              | 18            | 42     |
|                        |                              |                          |                  | Sum           | 128    |

Now we calculate the value of `Tx = 1/2 ∑▒〖t(t-1)〗 = 128/2 = 64`

We carry out the same process for the dependent variable and where we obtain the values ordered from lowest to highest and their corresponding range (y), with their respective values from 1 to 21, being as follows:

| Degree Of Collaboration | Rank(x) |
| ----------------------- | ------- |
| 1                       | 1       |
| 1                       | 2       |
| 1                       | 3       |
| 1                       | 4       |
| 1                       | 5       |
| 1                       | 6       |
| 2                       | 7       |
| 2                       | 8       |
| 2                       | 9       |
| 2                       | 10      |
| 2                       | 11      |
| 2                       | 12      |
| 2                       | 13      |
| 2                       | 14      |
| 3                       | 15      |
| 3                       | 16      |
| 3                       | 17      |
| 3                       | 18      |
| 3                       | 19      |
| 3                       | 20      |
| 3                       | 21      |

From this table we build the following:

| Range Of Collaborators | Positions                    | Amount Of Repetition(t) | Sum Of Positions | Assigned Rank | t(t-1) |
| ---------------------- | ---------------------------- | ----------------------- | ---------------- | ------------- | ------ |
| 1                      | 1, 2, 3, 4, 5 y 6            | 6                       | 21               | 3,5           | 30     |
| 2                      | 7, 8, 9, 10, 11, 12, 13 y 14 | 8                       | 84               | 10,5          | 56     |
| 3                      | 15, 16, 17, 18, 19, 20 y 21  | 7                       | 126              | 18            | 42     |
|                        |                              |                         |                  | Sum           | 128    |

We calculate: `Ty = 1/2 ∑▒〖t(t-1)〗 = 128/2 = 64`

We make a table with the original values of each variable and its respective assigned range, therefore:

| Original Value Of The Instruction Level | Assigned Rank(x) | Original Value Of The Degree Of Collaboration | Assigned Rank(y) |
| --------------------------------------- | ---------------- | --------------------------------------------- | ---------------- |
| 2                                       | 11,5             | 2                                             | 10,5             |
| 3                                       | 18               | 2                                             | 10,5             |
| 2                                       | 11,5             | 3                                             | 18               |
| 1                                       | 4,5              | 1                                             | 3,5              |
| 1                                       | 4,5              | 1                                             | 3,5              |
| 1                                       | 4,5              | 1                                             | 3,5              |
| 1                                       | 4,5              | 1                                             | 3,5              |
| 3                                       | 18               | 1                                             | 3,5              |
| 3                                       | 18               | 2                                             | 10,5             |
| 1                                       | 4,5              | 2                                             | 10,5             |
| 3                                       | 18               | 1                                             | 3,5              |
| 3                                       | 18               | 2                                             | 10,5             |
| 3                                       | 18               | 3                                             | 18               |
| 2                                       | 11,5             | 2                                             | 18               |
| 2                                       | 11,5             | 3                                             | 18               |
| 2                                       | 11,5             | 3                                             | 18               |
| 1                                       | 4,5              | 3                                             | 18               |
| 1                                       | 4,5              | 2                                             | 10,5             |
| 1                                       | 4,5              | 3                                             | 18               |
| 2                                       | 11,5             | 3                                             | 18               |
| 3                                       | 18               | 2                                             | 10,5             |
| 1                                       | 4,5              | 1                                             | 3,5              |

We are left only with the assigned ranges, since it is with them that we are going to build the table of concordant and discordant values. But we must also order the range (x) from lowest to highest. It is important to take into account that for this step it is necessary to order the range (x) but we must choose both variables, that is, also the range (y), so that the relationship with its ordered pair is not lost.

We will also add a column with the number of the row, so that they will notice the observations we make with respect to the row.

| Raw | Assigned Rank(x) | Assigned Rank(y) |
| --- | ---------------- | ---------------- |
| 1   | 4,5              | 3,5              |
| 2   | 4,5              | 3,5              |
| 3   | 4,5              | 3,5              |
| 4   | 4,5              | 3,5              |
| 5   | 4,5              | 10,5             |
| 6   | 4,5              | 18               |
| 7   | 4,5              | 10,5             |
| 8   | 4,5              | 18               |
| 9   | 4,5              | 3,5              |
| 10  | 11,5             | 10,5             |
| 11  | 11,5             | 18               |
| 12  | 11,5             | 18               |
| 13  | 11,5             | 18               |
| 14  | 11,5             | 18               |
| 15  | 11,5             | 18               |
| 16  | 18               | 10,5             |
| 17  | 18               | 3,5              |
| 18  | 18               | 10,5             |
| 19  | 18               | 3,5              |
| 20  | 18               | 10,5             |
| 21  | 18               | 18               |
| 22  | 18               | 10,5             |

Remember that matching values must meet two conditions simultaneously:

`x_i < x_j,` but also that `y_i < y_j`

If we observe the previous table, we can conclude that the values greater than 4.5 are found from row 10, therefore, for the first condition to be fulfilled, we must start from that row onwards. If we count them, it's 13 values, but for the second condition to be true, the values after row 10 must also be greater than 3.5. We can realize that the values found in rows 17 and 19 are not greater than 3.5 but are equal, so those values will not meet the second condition, therefore, the concordant values are 13 - 2 = 11 and these values are repeated until row 4.

In row 5, the first condition is met again that all values are greater than 4.5 from row 10, but the second condition is that from row 10 they must be greater than 10.5 where that only happens in the rows of 11 to 15 and in row 21, so in row 5 there are 6 concordant pairs, as in row 7. Now, for row 6, as there are no values greater than 18, there is no concordant pair.

We are then assembling the table of concordant values:

| Raw | Assigned Rank(x) | Assigned Rank(y) | Concordant Pairs |
| --- | ---------------- | ---------------- | ---------------- |
| 1   | 4,5              | 3,5              | 11               |
| 2   | 4,5              | 3,5              | 11               |
| 3   | 4,5              | 3,5              | 11               |
| 4   | 4,5              | 3,5              | 11               |
| 5   | 4,5              | 10,5             | 6                |
| 6   | 4,5              | 18               | 0                |
| 7   | 4,5              | 10,5             | 6                |
| 8   | 4,5              | 18               | 0                |
| 9   | 4,5              | 3,5              | 11               |
| 10  | 11,5             | 10,5             | 1                |
| 11  | 11,5             | 18               | 0                |
| 12  | 11,5             | 18               | 0                |
| 13  | 11,5             | 18               | 0                |
| 14  | 11,5             | 18               | 0                |
| 15  | 11,5             | 18               | 0                |
| 16  | 18               | 10,5             | 0                |
| 17  | 18               | 3,5              | 0                |
| 18  | 18               | 10,5             | 0                |
| 19  | 18               | 3,5              | 0                |
| 20  | 18               | 10,5             | 0                |
| 21  | 18               | 18               | 0                |
| 22  | 18               | 10,5             | 0                |

We continue filling the previous table, in row 9 we find again that the values must be greater than 3.5, so we have the same case as rows 1 to 4, that is, 11 concordant pairs.

In row 10, the first condition is that the values are greater than 11.5 and this is true from row 16 to 22, but since the value of (y) for that row is 10.5 the subsequent values must be greater than 10.5 and only in row 21 is this condition fulfilled, so for that row we have only one matching value.

From rows 11 to 22 there are no concordant pairs since although it is true that the first condition of row 16 to 22 is fulfilled, the second one that implies that the values must be greater than 18, it is not fulfilled and the same occurs for rows 11 through 15 and rows 16 through 22, there are simply no values greater than 18 so the first condition is not met.

We continue with the discordant pairs, remember that the conditions are:

`x_i < x_j and in addition to y_i > y_j`

Therefore, the subsequent values to the one we are considering must be greater than x_i and less than y_i.

For the first condition to be fulfilled, we must consider only the rows from 10 to 22, but we can realize that for the first 4 rows there are no values less than 3.5 in all subsequent values. Therefore, the discordant values for all these rows are null.

For row 5 we must look for the values of y_j that are less than 10.5 but starting from row 10 and we find them in rows 17 and 19, there we will have two discordant pairs, as is the case for row 7. While that for row 6, the values less than 18 that are from row 10 down, are the values that are in row 10 and all the values from row 16 to 22, minus the value that is found in the row 21, therefore, from there we will have 7 discordant values, in the same way as for row 8.

For row 9 there are no discordant pairs since there are no values less than 3.5. Later for row 10, there are only two values less than 10.5 and from row 11 to 15, all the values are less than 18, except for row 21, so there are 6 discordant pairs, the same happens for all rows between 11 and 15.

From rows 16 to 22, the first condition is not met, that is, the values are greater than 18, so there are no discordant pairs.

The complete table looks like this:

| Raw | Assigned Rank(x) | Assigned Rank(y) | Concordant Pairs |
| --- | ---------------- | ---------------- | ---------------- |
| 1   | 4,5              | 3,5              | 11               |
| 2   | 4,5              | 3,5              | 11               |
| 3   | 4,5              | 3,5              | 11               |
| 4   | 4,5              | 3,5              | 11               |
| 5   | 4,5              | 10,5             | 6                |
| 6   | 4,5              | 18               | 0                |
| 7   | 4,5              | 10,5             | 6                |
| 8   | 4,5              | 18               | 0                |
| 9   | 4,5              | 3,5              | 11               |
| 10  | 11,5             | 10,5             | 1                |
| 11  | 11,5             | 18               | 0                |
| 12  | 11,5             | 18               | 0                |
| 13  | 11,5             | 18               | 0                |
| 14  | 11,5             | 18               | 0                |
| 15  | 11,5             | 18               | 0                |
| 16  | 18               | 10,5             | 0                |
| 17  | 18               | 3,5              | 0                |
| 18  | 18               | 10,5             | 0                |
| 19  | 18               | 3,5              | 0                |
| 20  | 18               | 10,5             | 0                |
| 21  | 18               | 18               | 0                |
| 22  | 18               | 10,5             | 0                |
|     | Sum              | 67               | 50               |

We find `S = 67 - 50 = 17`

Let us then calculate the Kendall correlation coefficient:

`τ=S/(√(1/2 N(N-1)-Tx)*√(1/2 N(N-1)-Ty))`
`τ=S/(√(1/2 22(22-1)-64)*√(1/2 22(22-1)-64))`

Since in this case Tx = Ty, the two roots of the denominator are equal, so I can square them and cancel the root, so it is:

`τ=6/(22*21/2-64) = 17/167= 0,102`

This coefficient indicates that there is no correlation between the level of education of a worker with respect to his degree of collaboration in the factory, as we already know, this value is interpreted in the same way as the Pearson correlation coefficient, therefore, at As it gets closer to zero (0), the correlation between both variables is lower and this result indicates that the correlation is practically null.

## About the Author

Idais, Graduated in Mechanical Engineering, and a master’s degree in teaching component, she gave classes in several institutes of mathematics and physics, but she also dedicated several years of my life as a television producer, she did the scripts for mikes, the camera direction, editing of video and even the location. Later she was dedicated to SEO writing for a couple of years. she like poetry, chess and dominoes.
