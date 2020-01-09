"""Python file to create Matplotlib and Seaborn based charts"""

import seaborn as sns
import pandas as pd
import matplotlib.pyplot as plt

auto = pd.read_csv("auto.csv")
sp = '../site/assets/images/python/'

plt.subplot(2, 1, 1)
sns.violinplot(x='cyl', y='hp', data=auto)
plt.xlabel('Cylinders')
plt.ylabel('Horsepower (hp)')
plt.subplot(2, 1, 2)
sns.violinplot(x='cyl', y='hp', data=auto, inner=None, color='lightgray')
sns.stripplot(x='cyl', y='hp', data=auto, jitter=True, size=1.5)
plt.xlabel('Cylinders')
plt.ylabel('Horsepower (hp)')
plt.title('Violin plot of automobile cylinders versus horsepower', y=2.3)
fig = plt.gcf()
fig.set_size_inches(8, 8)
fig.savefig(sp + 'violin-plot-of-automobile-cylinders-versus-horsepower.png', dpi=80)
fig.clf()

# Generate a swarm plot of 'hp' grouped horizontally by 'cyl'
plt.subplot(2, 1, 1)
sns.swarmplot(x='cyl', y='hp', data=auto)
plt.xlabel('Cylinders')
plt.ylabel('Horsepower (hp)')

# Generate a swarm plot of 'hp' grouped vertically by 'cyl' with a hue of 'origin'
plt.subplot(2, 1, 2)
sns.swarmplot(x='hp', y='cyl', data=auto, hue='origin', orient='h')
plt.xlabel('Horsepower (hp)')
plt.ylabel('Cylinders')
plt.title('Swarmplot of automobile cylinders versus horsepower', y=2.3)
fig = plt.gcf()
fig.set_size_inches(8, 8)
fig.savefig(sp + 'swarmplot-of-automobile-horsepower-versus-cylinders.png', dpi=80)
fig.clf()

sns.lmplot(x='weight', y='hp', data=auto, hue='origin')
plt.title('Automobile weight versus horsepower by Continent')
plt.ylabel('Horsepower (hp)')
plt.xlabel('Weight')
fig = plt.gcf()
fig.set_size_inches(8, 8)
fig.savefig(sp + 'automobile-weight-versus-horsepower-by-continent.png', dpi=80)
fig.clf()

sns.jointplot(x='hp', y='mpg', data=auto, kind='hex')
plt.xlabel('Horsepower (hp)')
plt.ylabel('Miles per gallon (mpg')
fig = plt.gcf()
fig.set_size_inches(8, 8)
fig.savefig(sp + 'automobile-hexbin-jointplot-of-horsepower-versus-mpg.png', dpi=80)
fig.clf()

df = auto.loc[:, ['mpg', 'cyl', 'displ', 'hp', 'weight', 'accel', 'origin', 'color']]
sns.set(style="ticks")
sns.pairplot(df, hue="origin")
plt.tight_layout(pad=0.5)
fig = plt.gcf()
fig.set_size_inches(20, 20)
fig.savefig(sp + 'automobile-pairplot-by-origin.png', dpi=80)
fig.clf()

sns.set(style="white")
g = sns.PairGrid(df, diag_sharey=False)
g.map_lower(sns.kdeplot, cmap="Blues_d")
g.map_upper(plt.scatter)
g.map_diag(sns.kdeplot, lw=3)
plt.tight_layout(pad=0.5)
fig = plt.gcf()
fig.set_size_inches(20, 20)
fig.savefig(sp + 'automobile-pairgrid.png', dpi=80)
fig.clf()
