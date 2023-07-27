# Define a function to calculate allele frequencies for the sample data
calculate_HLA_frequency <- function(hped) {

  #load libraries
  if(!require(pacman)) install.packages("pacman")
  pacman::p_load(stringr, plyr, RColorBrewer, vroom, janitor,
    patchwork, tidyverse, devtools, ggpubr, ggpmisc, purrr, data.table)

  hped %>% drop_na()

  #read in data
  file <- data.frame(hped[17], A=unlist(hped[1:2]), B=unlist(hped[3:4]), C=unlist(hped[5:6]),
                     DQA1=unlist(hped[7:8]), DQB1=unlist(hped[9:10]), DRB1=unlist(hped[11:12]),
                     DPA1=unlist(hped[13:14]), DPB1=unlist(hped[15:16]))

  hla_types <- names(file)

  hla_a <- file[2] %>% drop_na()
  hla_b <- file[3] %>% drop_na()
  hla_c <- file[4] %>% drop_na()
  hla_dqa1 <- file[5] %>% drop_na()
  hla_dqb1 <- file[6] %>% drop_na()
  hla_drb1 <- file[7] %>% drop_na()
  hla_dpa1 <- file[8] %>% drop_na()
  hla_dpb1 <- file[9] %>% drop_na()

  all_hla <- c(hla_a, hla_b, hla_c, hla_dpa1, hla_dpb1, hla_dqa1, hla_dqb1, hla_drb1)

  total.hla.alleles <- nrow(hla_a)
  total.hla.alleles

  df.allele <- c()
  for (hla_type in hla_types) {
    hla <- all_hla[[hla_type]]

    # calculate allele frequency for allele 1
    for( allele in unique(hla) ) {
      #pull allele from hla_a_collapsed
      alleles <- hla[hla == allele]
      allele.freq <- (length(alleles)/total.hla.alleles)
      allele.count <- length(alleles)
      df <- data.frame(allele = allele, freq = allele.freq, count = allele.count)
      df.allele <- rbind(df.allele, df)
    }
  }

  df.allele
}

# -------------------------------------------------------------------------
#Plot allele frequency

Plot_HLA_allele_frequency <- function(hped, minFreq = 0.05) {

  freq_file <- calculate_HLA_frequency(hped)

  freq_file.split <- as_tibble(freq_file) %>%
    separate(col = allele, into = c("target_allele", NA), sep = "[*]", remove = F) %>%
    filter(target_allele != 0)
  freq_file.split <<- freq_file.split

  freq_file.split$Label <- if_else(freq_file.split$freq > minFreq, freq_file.split$allele, "others")

  unic <- unique(freq_file.split$Label)

  custom_colors3 <- c(colorRampPalette(RColorBrewer::brewer.pal(8, "Set2"))(length(unic)),"grey100")

  plot <- freq_file.split %>%
    group_by(target_allele, Label) %>%
    dplyr::summarise(freq2 = sum(freq)) %>%
    ggplot( aes(y=freq2, x=target_allele, fill=Label)) +
    geom_bar(stat='identity', show.legend = FALSE) + theme(legend.position = "none")+
    geom_text(aes(label = Label), position = position_stack(0.5), size = 2.5)+
    theme_classic()+
    xlab("HLA Alleles") +
    ylab("Allele Frequency")+ scale_fill_manual(values = custom_colors3)

  plot
}

# -------------------------------------------------------------------------
#Plot allele count
Plot_HLA_allele_count <- function(hped) {

  freq_file <- calculate_HLA_frequency(hped)

  freq_file.split <- as_tibble(freq_file) %>%
    separate(col = allele, into = c("target_allele", NA), sep = "[*]", remove = F) %>%
    filter(allele != 0)
  freq_file.split <<- freq_file.split

  alleles <- unique(freq_file.split$target_allele)
  count_plot <- c()

  for( allele in alleles ) {
    df2 <- freq_file.split[freq_file.split$target_allele == allele,]
    count_plot[allele] <- nrow(df2)
  }

  df2.count<- as.data.frame(count_plot) %>% add_column(Allele = c("A", "B", "C", "DQA1", "DQB1", "DRB1", "DPA1", "DPB1"))
  colnames(df2.count) <-c("Allele_Count", "Allele")

  df2.count <<- df2.count
  custom_colors1 <- colorRampPalette(RColorBrewer::brewer.pal(8, "Dark2"))(8)
  count_plot <- df2.count %>%
    ggplot( aes(y=Allele_Count, x=Allele, fill=Allele)) +  theme_classic()+
    geom_bar(stat='identity') + theme(legend.position = "none",
                                      axis.text.x = element_text(size = 16),
                                      axis.text.y = element_text(size = 16),
                                      axis.title.x = element_text(size = 18),
                                      axis.title.y = element_text(size = 18))+
    scale_fill_manual(values = custom_colors1)

  count_plot
}

# -------------------------------------------------------------------------
#Plot the target vs ref allele frequencies
Plot_HLA_target_vs_ref <- function(tgt_hped, ref_hped){

  tgt_file <- calculate_HLA_frequency(tgt_hped)
  ref_file <- calculate_HLA_frequency(ref_hped)

  ref <- ref_file %>% arrange(allele)
  tgt <- tgt_file %>% arrange(allele)

  ref_vs_target <- tgt %>% inner_join(ref, by = "allele", suffix = c(".target", "ref"))

  plot <- ref_vs_target %>%
    ggplot(aes(x = freqref, y = freq.target )) +
    geom_point() +
    scale_y_log10() +
    scale_x_log10()+
    theme_classic()+
    geom_point()+
    geom_smooth(method=lm, se=FALSE)+
    xlab("reference data") +
    ylab("target data")+
    stat_poly_eq()
  plot
}

# -------------------------------------------------------------------------
#Plot the diversity of HLA alleles
plot_HLA_Diversity <-  function(hped, gene = "A", ntop = 2){

  #load libraries
  if(!require(pacman)) install.packages("pacman")
  pacman::p_load(stringr, plyr, RColorBrewer, vroom, janitor,
                 patchwork, tidyverse, devtools, ggpubr, ggpmisc, purrr, data.table)

  #calculate frequency
  df_formatted <- hped %>%
    pivot_longer(cols = starts_with(c("A", "B", "C","DQA1","DQB1",
                                      "DRB1","DPA1","DPB1")),
                 names_to = "Column", values_to = "alleles") %>%
    separate(Column, into = c("category", "haplotype"), sep = "\\.") %>%
    dplyr::rename(population = Population)

  pop_count <- df_formatted %>%
    group_by(population,category) %>%
    summarize(total_alleles = n())

  allele_count <- df_formatted %>%
    filter(!is.na(alleles)) %>%
    group_by(population, alleles) %>%
    summarize(allele_count = n()) %>%
    mutate(tmp_allele = alleles) %>%
    separate(tmp_allele, into = c("category", "spec"), sep = "\\*") %>%
    select(-spec)

  final = allele_count %>%
    inner_join(pop_count, by = c("population", "category")) %>%
    group_by(population, alleles) %>%
    summarise(allele_freq = allele_count/total_alleles,
              allele_count = allele_count)

  tgt_al_freq  <- as_tibble(final) %>%
    separate(col = alleles, into = c("HLA_gene", NA), sep = "[*]", remove = F) %>%
    filter(HLA_gene == gene )
  tgt_al_freq  <<- tgt_al_freq

  #sort and rank
  sort_rank <- tgt_al_freq %>%
    group_by(population) %>%
    arrange(population, -allele_freq) %>%
    dplyr::mutate(
      Serial = row_number()
    ) %>%
    filter(Serial %in% c(1:ntop))

  #Extract unique values from the top alleles
  unic <- unique(sort_rank$alleles)

  #color code
  custom_colors5 <- c(colorRampPalette(RColorBrewer::brewer.pal(8, "Set2"))(length(unic)),"grey90")

  #plot
  tgt_al_freq %>%
    mutate(
      Label=if_else(alleles %in%  unic & allele_freq > 0.05, alleles, "others")) %>%
    group_by(population, Label) %>% dplyr::summarise(freq2 = sum(allele_freq)) %>%
    ggplot( aes(y=freq2, x=population, fill=Label)) +
    geom_bar(stat = "identity", show.legend = FALSE) +
    geom_text(aes(y = freq2,label = Label),
              position = position_stack(0.5),
              size = 4.5)+
    theme(legend.position = "none")+
    theme_classic()+
    labs(x = "Population", y = "Allele Frequency") +
    theme(axis.text.x = element_text(size = 16), axis.text.y = element_text(size = 16),
          axis.title.x = element_text(size = 18), axis.title.y = element_text(size = 18)) +
    scale_fill_manual(values = custom_colors5)
}
