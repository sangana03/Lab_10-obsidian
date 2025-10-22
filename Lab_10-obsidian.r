# ====================================================================
# lab10_obsidian.R
# Collaborative R Visualization Project
# Dataset: iris 
# Team Members:
# Name (Roll Number)
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

# You can also try color by species (optional enhancement)
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

# 4. Line Plot - Mean Petal Length per Species

# 5. Bar Plot - Count of Each Species

# 6. Pie Chart
