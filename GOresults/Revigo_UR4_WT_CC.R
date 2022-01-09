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
revigo.data <- rbind(c("GO:0005576","extracellular region",2.60815000059005,-0.497858741598282,-5.84680908042654,5.71732925644616,-3.46520532185632,0.999910138078878,0),
c("GO:0035658","Mon1-Ccz1 complex",0.0121909582093153,4.1642713250388,4.6276661620416,3.38721180031373,-1.40815513388225,0.841317117877972,2.19E-05),
c("GO:0005615","extracellular space",0.623098975579481,6.43181035614695,-0.767876534656713,5.09555638123519,-1.40815513388225,0.999927844519531,3.177E-05),
c("GO:0016021","integral component of membrane",55.5735330797001,-3.95122919969133,5.24932409641356,7.04586390572789,-4.52460585001803,0.895318546935376,6.548E-05),
c("GO:0071944","cell periphery",16.8258125088632,3.76177365913885,-4.53250727472821,6.5269720330768,-1.72873404593032,0.999864007567234,0.00011698),
c("GO:0016020","membrane",62.6812717479594,-4.94230049289642,-4.28555251223959,7.09813369276151,-3.49219911665639,0.999780656991371,0.00026288),
c("GO:0005886","plasma membrane",15.3904046858083,-6.02630546282864,1.10492150211994,6.48824603949702,-1.90284677101085,0.929702211651988,0.14178645),
c("GO:0031224","intrinsic component of membrane",55.7540672696874,-3.63748071255286,3.86399854425373,7.04727245246645,-4.51229878266973,0.895275124602513,0.29755246),
c("GO:0032580","Golgi cisterna membrane",0.0673852964843037,3.46018773574997,5.61819391674904,4.12959322836793,-1.40815513388225,0.703468588366659,0.37050326));

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
readr::write_tsv(one.data, "~/GitHub/CryptoGat201RNASeq_draft_b/GOresults/UR4_WT_CC.csv")

p <- ggplot(one.data, aes(value, description, fill = description))+
  theme(legend.position ="none")+
  geom_bar(stat = "identity")+
  labs(title = "CC up-regulated at 4hrs",
       x = "Frequency", y = "Location")+
  theme(text = element_text(size = 20))+
  theme(axis.text.x = element_text(size=10, angle = 90))+
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

p <- ggplot(one.data, aes(frequency, description, fill = description))+
  theme(legend.position ="none")+
  geom_bar(stat = "identity")+
  labs(title = "WT 4 Hours Up RPMI",
       x = "Frequency", y = "")

print(p)
