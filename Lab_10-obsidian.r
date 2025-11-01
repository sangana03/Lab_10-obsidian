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
# Adhit Amonkar 2304
# ====================================================================
# Load dataset
data(iris)

# View structure
str(iris)

# 1. Histogram - Distribution of Sepal Length
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
#    - Iris-virginica has the largest petal width range. 


# 4. Line Plot - Comparing Average petal and sepal length of all 3 species
ggplot(iris, aes(x = Species, group = 1)) + 
  

  stat_summary(aes(y = Petal.Length, color = "Petal Length"),
               fun = mean, geom = "line", lwd = 1) +
  stat_summary(aes(y = Petal.Length, color = "Petal Length"),
               fun = mean, geom = "point", size = 3) +
  

  stat_summary(aes(y = Sepal.Length, color = "Sepal Length"),
               fun = mean, geom = "line", lwd = 1) +
  stat_summary(aes(y = Sepal.Length, color = "Sepal Length"),
               fun = mean, geom = "point", size = 3) +
  

  labs(title = "Average Petal vs. Sepal Length by Species",
       y = "Average Length (cm)",
       color = "Measurement") + 
  theme_minimal()



# 5. Bar Plot - Mean Ratio of Petal Length to Petal Width per Species
iris$Ratio <- iris$Petal.Length / iris$Petal.Width
avg_ratio <- aggregate(Ratio ~ Species, data = iris, FUN = mean)

barplot(avg_ratio$Ratio,
        names.arg = avg_ratio$Species,
        main = "Mean Petal Length-to-Width Ratio by Species",
        xlab = "Species",
        ylab = "Average Ratio",
        col = c("orchid", "springgreen3", "steelblue"),
        border = "black",
        density = c(25, 10, 40),
        ylim = c(0, max(avg_ratio$Ratio) + 1))


# 6. Pie Chart - Proportion of Each Species
species_count <- table(iris$Species)

# Create pie chart
pie(species_count,
    labels = paste(names(species_count), "\n", round(100 * species_count / sum(species_count), 1), "%"),
    main = "Pie Chart of Iris Species Distribution",
    col = c("gold", "darkgreen", "deepskyblue"),
    border = "white",
    clockwise = TRUE)

# Add legend
legend("topright",
       legend = names(species_count),
       fill = c("gold", "green", "deepskyblue"),
       border = "white",
       title = "Species")


# 7. Heat Map 
library(reshape2)

# Compute correlation matrix
cor_matrix <- cor(iris[, 1:4])

# Melt correlation matrix for ggplot2
melted_cor <- melt(cor_matrix)

# Create heatmap
ggplot(melted_cor, aes(x = Var1, y = Var2, fill = value)) +
  geom_tile(color = "black", linewidth = 0.8) +
  geom_text(aes(label = round(value, 2),
                color = abs(value) > 0.5), size = 6, fontface = "bold") +
  scale_color_manual(values = c("black", "white"), guide = "none") +
  
  # Kcolor scheme
  scale_fill_gradient2(low = "yellow", mid = "orange", high = "red",
                       midpoint = 0, limit = c(-1, 1),
                       name = "Correlation") +
  
  # symmetrical just for clarity for same features correlation is always 1 
  geom_abline(intercept = 0, slope = 1, color = "black", linetype = "dashed") +
  
  # Labeling
  labs(title = "Heatmap of Feature Correlations",
       subtitle = "Showing pairwise correlation between flower measurements",
       x = "Features ", y = "") +
  theme_minimal(base_size = 14) +
  theme(
    plot.title = element_text(face = "bold", hjust = 0.5, size = 16),
    plot.subtitle = element_text(hjust = 0.5, size = 12, color = "gray30"),
    axis.text.x = element_text(angle = 30, vjust = 1, hjust = 0.5, face = "bold"),
    axis.text.y = element_text(face = "bold"),
    panel.grid = element_blank(),
    plot.margin = margin(10, 10, 10, 10)
  )
