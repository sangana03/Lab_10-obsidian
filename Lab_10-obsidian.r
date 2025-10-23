# ====================================================================
# lab10_obsidian.R
# Collaborative R Visualization Project
# Dataset: iris 
# Team Members:
# Rudresh 2330
# Sangana Ibrampurkar 2310
# Sanika Hoble 2309
# Unnat Umerye 2303
# Shripad Chodankar 2317
# Rakshita Kubal 2319 
# Adit Amonkar 23 
# ====================================================================
# Load dataset
data(iris)

# View structure
str(iris)

# 1. Histogram - Distribution of Sepal Length
# View structure
str(iris)

# Histogram for Sepal.Length
hist(iris$Sepal.Length,
     main = "Distribution of Sepal Length in Iris Dataset",
     xlab = "Sepal Length (cm)",
     ylab = "Frequency",
     col = "lightblue",
     border = "black")

library(ggplot2)
ggplot(iris, aes(x = Sepal.Length, fill = Species)) +
  geom_histogram(binwidth = 0.3, color = "black", alpha = 0.7) +
  labs(title = "Sepal Length Distribution by Species",
       x = "Sepal Length (cm)",
       y = "Count") +
  theme_minimal()


# 2. Scatter Plot - Sepal vs Petal Length
plot(iris$Sepal.Length, iris$Petal.Length,
     main = "Scatter Plot - Sepal vs Petal Length",
     xlab = "Sepal Length",
     ylab = "Petal Length",
     col = iris$Species,
     pch = 19)
legend("topleft", legend = unique(iris$Species), col = 1:3, pch = 19)


# 3. Box Plot - Petal Width by Species
# Description:
# This box plot visualizes the distribution of Petal Width for each species in the iris dataset.
# It helps identify the spread, median, and any potential outliers.

# Display first few rows to understand structure
head(iris)

# Box Plot to compare Petal Width across Species
boxplot(Petal.Width ~ Species,
        data = iris,
        main = "Box Plot of Petal Width by Species",
        xlab = "Species",
        ylab = "Petal Width (cm)",
        col = c("lightcoral", "lightgreen", "lightblue"),
        border = "darkblue",
        notch = TRUE)  #Adds notches to show median confidence interval
# Add grid lines for better readability
grid(nx = NULL, ny = NULL, col = "grey", lty = "dotted")

# Explanation :
# 1. Each box represents the interquartile range (IOR) of Petal Width for a species.
# 2. The horizontal line inside each box is the median Petal Width.
# 3. The whiskers show variability outside the upper and lower quartiles.
# 4. Points outside the whiskers (if any) represent outliers.
# 5. From the plot, we observe:
#    - Iris-setosa has the smallest and least variable petal width.
#    - Iris-versicolor shows moderate spread.
#    - Iris-virginica has the largest pertal width range. 


# 4. Line Plot - Mean Petal Length per Species
avg <- aggregate(Petal.Length ~ Species, iris, mean)
plot(avg$Species, avg$Petal.Length,
     type = "o",
     main = "Average Petal Length by Species",
     xlab = "Species",
     ylab = "Average Petal Length",
     col = "purple")


# 5. Bar Plot - Count of Each Species


# 6. Pie Chart


# 7. Heat Map 
