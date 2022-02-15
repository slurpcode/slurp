# 📐 Analysis of variance ANOVA for one factor and two factors

## ANOVA for a single factor

The analysis of variance is a statistical method capable of palpating the differences that exist between the means of 3 groups or more and is used when we have a single independent factor or a single variable. The idea is to try to find out if the variations of different levels of this factor can have a measurable consequence in the dependent variable.

But this method has certain limitations, since the analysis of variance can only be used when studying only one factor with a single dependent variable. On the other hand, if we compare the means between three or more groups, the method can indicate whether there is at least one pair of means that are significantly different, but it cannot specifically indicate which of the pairs it is. In addition, the method requires that the dependent variable have a normal distribution for each of the groups and also that the variability that exists within each group is similar among all groups.

The analysis of variance of a factor is a test that focuses on the differences that exist between the group means. It is a method that helps us to verify or reject the null hypothesis (Ho) between three population means or more, but yes, they are the same with respect to their alternative hypotheses (Ha), where even one of those means is different. The formal nomenclature of statistical hypotheses would be:

`Ho = μ1 = μ2 = ⋯ = μk`
`Ha = The means are not all the same`

Where μi is the mean of the value of the i-th level of the factor to be considered

`K = The number of means`

The analysis of variance compares the averages of each level with the general average and this is called “Between treatments”. The ANOVA method between the different levels obtains two estimates of variance and with them a quotient is calculated, so that if the quotient is approximately equal to 1, it can be said that the two variances are similar and the factor will not have any impact on the answer.

This method can be of great help when we suspect that an independent variable is a determining factor in the outcome of a certain process. For example, suppose we have a factory whose production process is being affected by some factor and we want to find out what it is that is decreasing performance. To do this, you want to run this method, using three or more variations or levels reached by this factor or independent variable. After counting the results of the observations in each run, see if any difference is found when we compare the means for each group of observations using analysis of variance. It is then when we will have the evidence that the investigated factor may have some influence on the result.

Now let's go with an illustrative example of the analysis of variance of a factor: Let us suppose that a certain factory produces an adhesive gel that is sold in small jars. The gel has an important property, which is its viscosity, since if it is too liquid its adherence is affected, while if it is too thick, it ends up being very difficult to apply.

![Hair Gel](_static/images/analysis-of-variance/image1.jpg)

Lately the factory has received complaints from some customers, who are dissatisfied as the gel is not as consistent as usual. The plant manager is concerned and decides to investigate the matter, so he begins by examining the viscosity of the five most recent batches of production. In this way, if he manages to find any difference between the viscosity of any of the batches, this would mean the real problem. He can even help you formulate hypotheses about the factors that could cause inconsistencies between batches.
The way to measure the viscosity is using an instrument that has a rotor that is submerged inside the jar of adhesive gel. This is how the mean value of resistance to torsion can be measured and this procedure is carried out with five jars from each of the 5 batches and they are chosen at random. In turn, each batch has five levels, this implies that the test is repeated five times per batch and is what is called “one factor design”. The results obtained are expressed below:

Lately the factory has received complaints from some customers, who are dissatisfied as the gel is not as consistent as usual. The plant manager is concerned and decides to investigate the matter, so he begins by examining the viscosity of the five most recent batches of production. In this way, if he manages to find any difference between the viscosity of any of the batches, this would mean the real problem. He can even help you formulate hypotheses about the factors that could cause inconsistencies between batches.

The way to measure the viscosity is using an instrument that has a rotor that is submerged inside the jar of adhesive gel. This is how the mean value of resistance to torsion can be measured and this procedure is carried out with five jars from each of the 5 batches and they are chosen at random. In turn, each batch has five levels, this implies that the test is repeated five times per batch and is what is called “one factor design”. The results obtained are expressed below:

|  | Description |Lot 1 |Lot 2 |Lot 3 |Lot 4 |Lot 5 |
| ----------- | ----------- |----------- |----------- |----------- |----------- |----------- |
| Jar 1|29,39 |30,63 |27,16 |31,03 |29,67 |
| Jar 2 |31,51 |32,10 |26,63 |30,98 |29,32 |
| Jar 3 |30,88 |30,11 |25,31 |28,95 |26,87 |
| Jar 4 |27,63 |29,63 |27,66 |31,45 |31,59 |
| Jar 5|28,85 |29,68|27,10 |29,70 |29,41 |
| Mean |29,65 |30,43 |26,77 |30,42 |29,37 |

Now we are going to build what is called the ANOVA table, where we must be clear about the nomenclature to use:

```
ni = Represents the number of observation i in batch i
N = is the number of total observations
Yij = The j-th observation of the i-th treatment,
Y ̅i = The mean of the i-th treatment
Y ̿ = The global mean of all observations
```
We are now going to build the ANOVA table, and then look for the values of the sum of its squares. This allows us to quantify the variability of a group of data, in addition to knowing the mean of each of the data in the set. The following formula is responsible for dividing the global variability into 2 parts. The first is the variability with respect to the factor levels and the second is the variability that refers to random errors.

When building the ANOVA table we must specify the elements that it includes:
The examined factor and the sources of variation must be defined, which in our case are: the batch, the total and the error.

The degrees of freedom must be established for each source of variation.

Calculate the sum of squares (SS) for each source of variation and also the total of all sources.

When we add the squares and divide it by the corresponding degrees of freedom, we get the mean of the squares.

If we divide the specific mean of squares of the batch factor by the mean of squares of the error, we obtain the ratio F.

The formulas and nomenclature to be used are the following:

`SS (Total) = SS (Factor) + SS (Error)`
`∑_(i=1)^a▒∑_(j=1)^ni▒〖( Yij-Y ̿  )〗^2 =  ∑_(i=1)^a▒〖ni〖(Y ̅i- Y ̿)〗^2 〗+ ∑_(i=1)^a▒∑_(j=1)^ni▒〖(Yij-Y ̅i)〗^2`

Where each of the sums corresponds one by one to the sum of squares of the previous equation. While it is true that this formula can be seen as somewhat complicated, if we focus on each element individually, it becomes much easier to understand. In the following table we are going to build each of the elements that make up the formula, where the first column is made up of the measurements that we obtained of tensile strength.

| Lot | Yij |Y ̅i |Y ̿ |Y ̅i- Y ̿ |Yij- Y ̿ |Yij-Y ̅i | 〖(Y ̅i- Y ̿)〗^2 |〖(Yij-Y ̅i)〗^2|〖(Yij-Y ̿)〗^2|
| ----------- | ----------- |----------- |----------- |----------- |----------- |----------- |----------- |----------- |----------- |
|1|29,39|29,65|29,33|0,32|0,06|-0,26|0,1|0,07|0|
|1|31,51|29,65|29,33|0,32|2,18|1,86|0,1|3,46|4,75|
|1|30,88|29,65|29,33|0,32|1,55|1,23|0,1|1,51|2,4|
|1|27,63|29,65|29,33|0,32|-1,7|-2,02|0,1|4,08|2,89|
|1|28,85|29,65|29,33|0,32|-0,48|-0,8|0,1|0,64|0,23|
|2|30,63|30,43|29,33|1,1|1,3|0,2|1,21|0,04|1,69|
|2|32,1|30,43|29,33|1,1|2,77|1,67|1,21|2,79|7,68|
|2|30,11|30,43|29,33|1,1|0,78|-0,32|1,21|0,1|0,61|
|2|29,63|30,43|29,33|1,1|0,3|-0,8|1,21|0,64|0,09|
|2|29,68|30,43|29,33|1,1|0,35|-0,75|1,21|0,56|0,12|
|3|27,16|26,77|29,33|-2,56|-2,17|0,39|6,55|0,15|4,71|
|3|26,63|26,77|29,33|-2,56|-2,7|-0,14|6,55|0,02|7,29|
|3|25,31|26,77|29,33|-2,56|-4,02|-1,46|6,55|2,14|16,16|
|3|27,66|26,77|29,33|-2,56|-1,67|0,89|6,55|0,79|2,79|
|3|27,1|26,77|29,33|-2,56|-2,23|0,33|6,55|0,11|4,97|
|4|31,03|30,42|29,33|1,09|1,7|0,61|1,19|0,37|2,89|
|4|30,98|30,42|29,33|1,09|1,65|0,56|1,19|0,31|2,72|
|4|28,95|30,42|29,33|1,09|-0,38|-1,47|1,19|2,16|0,14|
|4|31,45|30,42|29,33|1,09|2,12|1,03|1,19|1,06|4,49|
|4|29,7|30,42|29,33|1,09|0,37|-0,72|1,19|0,52|0,14|
|5|29,67|29,37|29,33|0,04|0,34|0,3|0|0,09|0,12|
|5|29,32|29,37|29,33|0,04|-0,01|-0,05|0|0|0|
|5|26,87|29,37|29,33|0,04|-2,46|-2,5|0|6,26|6,05|
|5|31,59|29,37|29,33|0,04|2,26|2,22|0|4,93|5,11|
|5|29,41|29,37|29,33|0,04|0,08|0,04|0|0|0,01|
|SS|||||||45,25|32,8|78,05|

If we realize in the formula, the sum of `〖(Y ̅i- Y ̿)〗^2= SS (Factor)`, while that of `〖(Yij-Y ̅i)〗^2 = SS (Error)` and  `〖(Yij-Y ̿)〗^2 = SS (Total)`

We are now going to show how the degrees of freedom that indicate the amount of independent data used to calculate the sum of squares are calculated. When we are designing a factor of k levels, which in this case is five batches and each batch has five jars, this indicates that `k = 5` and `N = 25`, so the degrees of freedom are obtained as follows :

||Degrees Of Freedom||
|----|----|----|
|SS (Factor)|k-1|5-1=4|
|SS (Error)|N-k|25-5=20|
|SS (Total)|N-1|25-1=24|

We must now obtain the mean of squares (MS) and the ratio F, for this we must divide each sum of squares by its corresponding degrees of freedom.

Sum of squares Degrees of freedom Mean squares Reason F

||Sum Of Squares|Degrees Of Freedom| Mean Squares| Reason F|
|----|----|----|----|----|
|SS(Factor)|45,25|4|45,25/4 = 11,31|11,31/1,64 = 6,89|
|SS(Error)|32,8|20|32, 8/20=1,64||

We can now pour the data into a summary table:

|Source|Degrees Of Freedom| Sum Of Squares| Mean Squares| Reason F|
|-----|-----|-----|-----|-----|
|Lot|4|45.25|11.31|6.90|
|Error|20|32.80|1.64||
|Total|24|78.05|||

When the means are equal, the null hypothesis is true and both the square means of the factor (batch) and the error are very similar and as for the ratio F, it would have a value very close to 1. On the contrary, when rejects the null hypothesis, the mean square of the factor will be greater than the mean square of the error and for this case, the ratio F is greater than one.

Therefore, for the previous example we can see that the ratio F has a value of 6.90 and this already provides us with very significant evidence rejecting the null hypothesis, that is, the means are not equal. On the other hand, we can see that the ratio F is significantly greater than 1.

It is important to take into account that the ratio F is obtained by dividing the mean square of the factor by the mean square of the error.

Once we have an idea of how the ANOVA table is calculated, we can skip these steps and let Excel perform the above calculations. To do this, we simply have to go to "Data" → "Data analysis" → Search in the "Analysis of variance of a factor" display and a new window opens, where we must go to the "Input range" and choose all the data that we obtained from the measurements of all the batches, that is, the initial table, but yes, without placing the calculations of the average that we include in this table. In that window, by default it shows us an alpha value of 0.05 which is the pre-set value to compare the p value, therefore, if the p value is less than this alpha value, the null hypothesis can be rejected.
Subsequently, we must mark the “Output range” round and choose a cell to show us the result of the ANOVA table. After performing the previous steps, Excel shows us in the summary, certain relevant calculations:

## VARIANCE ANALYSIS

|Origin Of Variations|Sum Of Squares| Degrees Of Freedom| Mean Squares| F | Probability| Critical value for F|
|----|----|----|----|----|----|----|
|Between Groups|45,26|4|11,31|6,899|0,0012|2,866|
|Within Groups|32,80|20|1,64||||
|Total|78,053|24|||||

It is important to emphasize that the alpha value cannot be compared with the F ratio, since the alpha value is only compared with the value of p and in this case, we can realize that this value is 0,0012  which is ultimately significantly less than 0,05  this indicates that the null hypothesis can be rejected.

We can also observe that the ratio F can be compared with the critical value of F, we must take into account that the fact that the ratio F is greater than 1 is not a reliable indication, since this can happen thanks to chance. However, if the ratio F is greater than its critical value, it is a comparable indication that a value of p is less than alpha and both results mean that the null hypothesis must be rejected.

In this case we can realize that not only is the value of p less than alpha, but that the ratio F is significantly greater than the critical value, so there is no doubt that for this example, the null hypothesis is rejected, so We can assure you that when we refer to torsional strength, not all averages are the same, so there will be a difference in one or more of the batches.

If we look at the means of each of the lots

|Lot Number|Mean|
|---|----|
|1|29,65|
|2|30,43|
|3|26,77|
|4|30,42|
|5|29,37|

Based on the results of the averages of each batch, we can see that batch three has a torsional strength of 26.77 that compared to the other four batches we can see that its average is lower, so it is recommended to investigate Bottom batch 3 to find out what is the factor that affects the viscosity of that batch and try to correct it, since the adherence of the gel is being affected.

## Analysis of variance for two factors

We are now going to show a solved exercise with two factors: the environmental protection agency requires to determine the effect of two water treatment methods with respect to the absorption of magnesium.

![Water Treatment Plant](_static/images/analysis-of-variance/image2.jpg)

For this, magnesium levels are measured in grams per cubic centimeter (gr / cc) and all different levels of time are incorporated into the experiment, which yields the following data:

<table border="1">
    <thead>
        <tr>
            <th></th>
            <th colspan="2">Treatment</th>
        </tr>
    </thead>
    <tbody>
    <tr>
       <th>Time (hours)</th>
       <th> 1</th>
       <th> 2</th>
       </tr>
       <tr>
       <td rowspan="3">1</td>
       <td>2,19</td>
       <td>2,03</td>
       </tr>
       <tr>
       <td>2,15</td>
       <td>2,01</td>
       </tr>
       <tr>
       <td>2,16</td>
       <td>2,04</td>
       </tr>
       <tr>
       <td rowspan="3">2</td>
       <td>2,01</td>
       <td>1,88</td>
       </tr>
       <tr>
       <td>2,03</td>
       <td>1,86</td>
       </tr>
       <tr>
       <td>2,04</td>
       <td>1,91</td>
       </tr>
    </tbody>
</table>

In this exercise, as we can see, we have two factors that can intervene in the absorption of magnesium, the first factor is time and the second factor is the treatment. The idea is to try to find out if the time influences the absorption of magnesium, the treatment used or both factors.
The statement of the null hypotheses for each of the factors is as follows:

```
Factor A: Time
Factor B: Treatment
HoA: there is no difference between the time and the absorption of magnesium
HoB: there is no difference between magnesium absorption treatment
HoAB: there is no interaction between time and treatment
```

To find the sum of squares of the factor a, the factor of, of the error and the sum of total squares we must apply the following formulas:

`SSA = ∑▒〖ni〖(y ̂i-y..)〗^2 〗`
`SSB = ∑▒〖ni〖(y ̂j-y..)〗^2 〗`
`SSE = ∑▒〖sij^2 〗(nij-1)`
`SST= S_Total^2 (N-1)`

The nomenclature to use in each of these formulas is the following:

```
y .. = total average
yi = row average
yj = column average
nj = number of data in a column
ni = number of data in a row
nij = number of data in a cell
sij = the variance of each cell
a = number of rows
b = number of columns
N = total number of data
```
We are defining for our exercise the values of:

N = 12 Since the total number of data supplied is 12

ni = 6 This is the number of data per row, but we must assume as a row, all the data that correspond to the time of 1 hour, that is, both treatment one and treatment two for the first time, have six data.

nj = 6 This number corresponds to the number of data per column, assuming as a column all the data from treatment 1, both for time 1 and time 2

Now we are going to find the averages corresponding to the rows, the columns and the total average. We will start by making a table with the averages of each time with each treatment.

<table border="1">
    <thead>
        <tr>
            <th></th>
            <th colspan="2">Treatment</th>
        </tr>
    </thead>
    <tbody>
    <tr>
       <th>Time (hours)</th>
       <th> 1</th>
       <th> 2</th>
       </tr>
       <tr>
       <td >1</td>
       <td>2,17</td>
       <td>2,01</td>
       </tr>
       <tr>
       <td>2</td>
       <td>2,01</td>
       <td>1,88</td>
       </tr>
    </tbody>
</table>

If, in turn, we average each of the rows and each of the columns, we will obtain the following averages:

<table border="1">
    <thead>
        <tr>
            <th></th>
            <th colspan="2">Treatment</th>
            <th></th>
        </tr>
    </thead>
    <tbody>
    <tr>
       <th>Time (hours)</th>
       <th> 1</th>
       <th> 2</th>
       <th>Time Averagers</th>
       </tr>
       <tr>
       <td >1</td>
       <td>2,17</td>
       <td>2,095</td>
       <td>2,095</td>
       </tr>
       <tr>
       <td>2</td>
       <td>2,03</td>
       <td>1,883</td>
       <td>1,955</td>
       </tr>
       <tr>
       <th>Averages Treatments</th>
       <td>2,095</td>
       <td>1,955</td>
       <td></td>
       </tr>
    </tbody>
</table>

```
Time average 1 (y ̂1) = 2,095
Average of time 2 (y ̂2) = 1,955
Average of treatment 1 (y ̂1) = 2,095
Average of treatment 2 (y ̂2) = 1,955
```

If we average these four values, we will obtain the total average

<table border="1">
    <thead>
        <tr>
            <th></th>
            <th colspan="2">Treatment</th>
            <th></th>
        </tr>
    </thead>
    <tbody>
    <tr>
       <th>Time (hours)</th>
       <th> 1</th>
       <th> 2</th>
       <th>Time Averagers</th>
       </tr>
       <tr>
       <td >1</td>
       <td>2,17</td>
       <td>2,027</td>
       <td>2,095</td>
       </tr>
       <tr>
       <td>2</td>
       <td>2,027</td>
       <td>1,883</td>
       <td>1,955</td>
       </tr>
       <tr>
       <th>Averages Treatments</th>
       <td>2,095</td>
       <td>1,955</td>
       <td>2025</td>
       </tr>
    </tbody>
</table>

`y .. = 2,025`

We now go with the sum of squares of the time factor

`SSA = ∑▒〖ni〖(y ̂i-y..)〗^2 〗 = 6 [ 〖(2,095 – 2,025)〗^2 + 〖(1,955 – 2,025)〗^2] = 0,0588`

If we look carefully, for this particular exercise the values of the averages are the same for the rows (time) as for the columns (treatment), therefore, for the calculations of the sum of squares of both factors, we will obtain the same results.

`SSB = ∑▒〖ni〖(y ̂j-y..)〗^2 〗 = 0,0588`

To calculate the sum of squares of the interaction between both SSAB factors, we must perform the following procedure:

1. Calculate the sum of values of each treatment for each of the times, for example, for time 1 there are 3 tests of treatment 1, these three data are the ones to be added and the same for the 3 data that represent the measurements of treatment 2 for time 1. In the same way, the pertinent summations are made for time 2 with respect to treatments 1 and 2.

![Mathematical Table](_static/images/analysis-of-variance/image2.jpg)

The sum of each row and column is also calculated

|Sum Factor Intersection|1|2|Sum of Coulumns|
|----|----|----|----|
|1|6,5|6,08|12,58|
|2|6,08|5,65|11,73|
|Sum of Rows|12,58|11,73|24,31|

Each sum of the 4 intersections of values is squared and divided by the number of data included between those intersections, in this case it is 3. To then subtract the sum of the rows and columns divided in turn by the number of data that involve that it is 6 for both the rows and the columns and finally the 2 values of the summations of rows or columns are added (The calculation is the same), but it is divided again by the number of values involved totals, which is 12.

`SSAB = ([〖6,5〗^2+ 〖6,08〗^2+ 〖6,08〗^2+ 〖5,65〗^2)])/3-  ((〖12,58〗^2+〖11,73〗^2+ 〖12,58〗^2+ 〖11,73〗^2  ))/6+  〖24,31〗^2/12 =0,000033`

We are now going to calculate SST, for this we must first have what is called the variation factor that is not more than the last term of the previous equation:

`Fv = 〖24,31〗^2/12  = 49,2075`

Now I square all 12 data

<table border="1">
    <thead>
        <tr>
            <th colspan="2">Squared Data</th>
        </tr>
    </thead>
    <tbody>
    <tr>
       <th> 4,7961</th>
       <th> 4,1209</th>
       </tr>
       <tr>
       <th> 4,6225</th>
       <th> 4,0401</th>
       </tr>
       <tr>
       <th> 4,6656</th>
       <th> 4,1616</th>
       </tr>
       <tr>
       <th> 4,0401</th>
       <th> 3,4596</th>
       </tr>
       <tr>
       <th> 4,1616</th>
       <th> 3,6481</th>
       </tr>
    </tbody>
</table>

Calculate the sum of all the data in the previous table:

`∑▒〖Squared data〗 = 49,3334`
`SST = ∑▒〖Squared data〗 – Fv = 49, 3334 – 49,2075 = 0,1259`

We are going to make a table with the data obtained:

||SS|GL|
|----|---|----|
|Factor A|0,0588|a-1= 2-1= 1|
|Factor B|0,0588|b-1= 2-1=1|
|Interaction A B|0,000033|(a-1)(b-1) = 1*1 =1|
|Error|0,000033|(N-1)-a-b-ab = 12-1-1-1-1= 8|
|Total|0,1259|N-1 = 11|


The error is calculated = `SSA + SSB + SSAB - SST`

`SSE = 0.0588 + 0.0588 + 0.000033 - 0.1259 = 0.008267`

A is the number of rows and b the number of columns, it is important to remember that there are only 2 rows, one for each time.

With the data in the previous table we can already find the mean of squares and the ratio F, remember that to calculate these values it is enough to divide the sum of squares by its corresponding degree of freedom.

```
MSA = 0.0588 / 1 = 0.0588
MSB = 0.0588 / 1 = 0.0588
MSAB = 0.000033 / 1 = 0.000033
MSE = 0.008267 / 8 = 0.001033375
```

Now let's calculate the value of F of each of the values and for this I will have to divide the mean of squares by the mean of squares of the error (MSE)

```
FA = MSA / MSE = 0.588 / 0.001033375 = 56.9
FB = MSB / MSE = 0.588 / 0.001033375 = 56.9
FAB = MSAB / MSE = 0.000033 / 0.001033375 = 0.0319226
```
The next step is to find the different critical Fs to be able to make the relevant comparisons and for this it will be necessary to use the following format:

Critical F (Degrees of freedom Factor; Degrees of freedom Error; Significance level that we establish)

It is very clear which are the degrees of freedom for each factor and the degree of freedom of the error, the level of significance established is generally 0.05 and for this there is a specific table to find the critical value of F, for this significance level. We are going to substitute the data for each critical value of F for each factor:

```
Critical F A (1, 8, 0.05)
Critical F B (1, 8, 0.05)
Critical F A B (1, 8, 0.05)
```
As we can see, in this case the critical values of each factor are the same, but we must take into account that this does not happen in all cases.

We go to the table of critical values of the distribution of F with a significance level of 0.05 and we must intercept the degree of freedom of each factor that is located in the columns of the table, with the degree of freedom of the error it is represented in the table by the rows.

The value obtained in the table is 5,318 and for this case we are going to compare each of the values of each factor with the critical value. Given the case that the value of F of a factor is greater than the critical value of F, we will reject the null hypothesis, while if it is less, the null hypothesis will not be rejected.

If we compare the value of F with the critical value specifically for the time factor (Factor A) → 56.9 > 5.318, the null hypothesis will be rejected and this implies that our null hypothesis is that time does not influence the absorption of magnesium, but calculations indicate that time does indeed influence magnesium absorption.

If we review the same previous process by the Treatment factor (Factor B) we obtain exactly the same result → 56.9 > 5.318 and therefore, the null hypothesis proposed for this factor is also rejected and then we can say that the treatment factor also influences the absorption of magnesium.

However, when we carry out the same previous process for the interaction between factors A and B, we note that → 0.0319 < 5.318, so that here the null hypothesis cannot be rejected and then we can conclude that the interaction that exists between the time and treatment does not influence magnesium absorption.

## About The Author

Idais, Graduated in Mechanical Engineering, and a master’s degree in teaching component, she gave classes in several institutes of mathematics and physics, but she also dedicated several years of my life as a television producer, she did the scripts for mikes, the camera direction, editing of video and even the location. Later she was dedicated to SEO writing for a couple of years. she like poetry, chess and dominoes.
