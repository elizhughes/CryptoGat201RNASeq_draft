# A plotting R script produced by the Revigo server at http://revigo.irb.hr/
# If you found Revigo useful in your work, please cite the following reference:
# Supek F et al. "REVIGO summarizes and visualizes long lists of Gene Ontology
# terms" PLoS ONE 2011. doi:10.1371/journal.pone.0021800

# --------------------------------------------------------------------------
# If you don't have the ggplot2 package installed, uncomment the following line:
# install.packages( "ggplot2" );
library( ggplot2 );

# --------------------------------------------------------------------------
# If you don't have the scales package installed, uncomment the following line:
# install.packages( "scales" );
library( scales );

# --------------------------------------------------------------------------
# Here is your data from Revigo. Scroll down for plot configuration options.

revigo.names <- c("term_ID","description","frequency","plot_X","plot_Y","log_size","value","uniqueness","dispensability");
revigo.data <- rbind(c("GO:0005730","nucleolus",0.862267774247056,5.08320058627048,0.650008167436591,5.23664053269973,-4.40654598577161,0.599964906703971,0),
c("GO:0030687","preribosome, large subunit precursor",0.0420483049967727,-4.72905359680571,1.76657798038812,3.92479599579791,-4.08654648078893,0.640427550089388,0),
c("GO:0009331","glycerol-3-phosphate dehydrogenase complex",0.103603143207056,-4.36327264900595,-2.62352421130541,4.3163897510732,-2.35459834147482,0.66724552857926,0.25285935),
c("GO:0030684","preribosome",0.182419338159979,-5.04135019112704,0.413959844397736,4.56207863900821,-3.33957745187034,0.629210903615278,0.54607196),
c("GO:0031981","nuclear lumen",2.37534170185777,4.98034286571357,-0.568700567452285,5.6767228663729,-1.65703441204688,0.596463071717189,0.80687089));

one.data <- data.frame(revigo.data);
names(one.data) <- revigo.names;
one.data <- one.data [(one.data$plot_X != "null" & one.data$plot_Y != "null"), ];
one.data$plot_X <- as.numeric( as.character(one.data$plot_X) );
one.data$plot_Y <- as.numeric( as.character(one.data$plot_Y) );
one.data$log_size <- as.numeric( as.character(one.data$log_size) );
one.data$value <- as.numeric( as.character(one.data$value) );
one.data$frequency <- as.numeric( as.character(one.data$frequency) );
one.data$uniqueness <- as.numeric( as.character(one.data$uniqueness) );
one.data$dispensability <- as.numeric( as.character(one.data$dispensability) );
#head(one.data);
readr::write_tsv(one.data, "~/GitHub/CryptoGat201RNASeq_draft_b/GOresults/DR4_WT_CC.csv")


p <- ggplot(one.data, aes(frequency, description, fill = description))+
  theme(legend.position ="none")+
  geom_bar(stat = "identity")+
  labs(title = "CC down-regulated at 4hrs",
       x = "Frequency", y = "Location")+
  theme(text = element_text(size = 20))+
  theme(axis.text.x = element_text(size=3, angle = 90))+
  scale_color_brewer(palette="Set1")

print(p)






# --------------------------------------------------------------------------
# Names of the axes, sizes of the numbers and letters, names of the columns,
# etc. can be changed below

p1 <- ggplot( data = one.data );
p1 <- p1 + geom_point( aes( plot_X, plot_Y, colour = value, size = log_size), alpha = I(0.6) ) + scale_size_area();
p1 <- p1 + scale_colour_gradientn( colours = c("blue", "green", "yellow", "red"), limits = c( min(one.data$value), 0) );
p1 <- p1 + geom_point( aes(plot_X, plot_Y, size = log_size), shape = 21, fill = "transparent", colour = I (alpha ("black", 0.6) )) + scale_size_area();
p1 <- p1 + scale_size( range=c(5, 30)) + theme_bw(); # + scale_fill_gradientn(colours = heat_hcl(7), limits = c(-300, 0) );
ex <- one.data [ one.data$dispensability < 0.15, ];
p1 <- p1 + geom_text( data = ex, aes(plot_X, plot_Y, label = description), colour = I(alpha("black", 0.85)), size = 3 );
p1 <- p1 + labs (y = "semantic space x", x = "semantic space y");
p1 <- p1 + theme(legend.key = element_blank()) ;
one.x_range = max(one.data$plot_X) - min(one.data$plot_X);
one.y_range = max(one.data$plot_Y) - min(one.data$plot_Y);
p1 <- p1 + xlim(min(one.data$plot_X)-one.x_range/10,max(one.data$plot_X)+one.x_range/10);
p1 <- p1 + ylim(min(one.data$plot_Y)-one.y_range/10,max(one.data$plot_Y)+one.y_range/10);


# --------------------------------------------------------------------------
# Output the plot to screen

p1;

# Uncomment the line below to also save the plot to a file.
# The file type depends on the extension (default=pdf).

# ggsave("/path_to_your_file/revigo-plot.pdf");


