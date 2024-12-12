library(ggplot2)
library(desplot)

plot_field <- function(env) {
  desplot::desplot(
    data[data$Env == env, ],
    Block ~ Range + Pass,
    out1 = Experiment,
    text = Replicate,
    cex = 1,
    ticks = T,
    main = env
  )
}

envs2019 <- c('DEH1_2019', 'TXH2_2019', 'NCH1_2019', 'SCH1_2019', 'IAH3_2019', 'MNH1_2019', 'IAH2_2019', 'TXH3_2019', 'NYH3_2019', 'ILH1_2019',
              'WIH1_2019', 'GAH1_2019', 'WIH2_2019', 'TXH1_2019', 'IAH4_2019', 'MIH1_2019', 'INH1_2019', 'GEH1_2019', 'IAH1_2019', 'NYH2_2019',
              'GAH2_2019', 'NEH2_2019', 'NEH1_2019')

envs2020 <- c('DEH1_2020', 'GAH1_2020', 'GAH2_2020', 'GEH1_2020', 'IAH1_2020', 'INH1_2020', 'MIH1_2020', 'MNH1_2020', 'NCH1_2020', 'NEH1_2020', 'NEH2_2020',
              'NEH3_2020', 'NYH2_2020', 'NYH3_2020', 'NYS1_2020', 'SCH1_2020','TXH1_2020', 'TXH2_2020', 'TXH3_2020', 'WIH1_2020', 'WIH2_2020', 'WIH3_2020')

envs2021 <- c('COH1_2021', 'DEH1_2021', 'GAH1_2021', 'GAH2_2021', 'GEH1_2021', 'IAH1_2021', 'IAH2_2021', 'IAH3_2021', 'IAH4_2021', 'ILH1_2021', 'INH1_2021', 'MIH1_2021',
              'MNH1_2021', 'NCH1_2021', 'NEH1_2021', 'NEH2_2021', 'NEH3_2021', 'NYH2_2021', 'NYH3_2021', 'NYS1_2021', 'SCH1_2021', 'TXH1_2021', 'TXH2_2021', 'TXH3_2021',
              'WIH1_2021', 'WIH2_2021', 'WIH3_2021')

envs <- c(envs2019, envs2020, envs2021)

data <- read.csv('data/Training_Data/1_Training_Trait_Data_2014_2021.csv')
data <- data[data$Env %in% envs, c(1:10, 24)]
data$Field_Location <- NULL
data <- data[data$Hybrid != 'LOCAL_CHECK', ]
data <- data[order(data$Experiment), ]  # to use heterogeneous variances if needed
rownames(data) <- NULL
data$rep <- interaction(data$Replicate, data$Block)
for (variable in c('Env', 'Experiment', 'Replicate', 'Block', 'rep', 'Plot', 'Hybrid')) {
  data[, variable] <- factor(data[, variable])
}

output_file <- "plot/plot_NCH1_2020.png"
png(output_file, width = 1000, height = 700)
plot_field('NCH1_2020')
dev.off

output_file <- "plot/plot_IAH3_2021.png"
png(output_file, width = 1000, height = 700)
plot_field('IAH3_2021')
dev.off


