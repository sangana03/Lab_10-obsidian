# Load dataset
data(iris)

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
