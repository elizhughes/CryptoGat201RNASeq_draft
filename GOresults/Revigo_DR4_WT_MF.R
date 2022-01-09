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
revigo.data <- rbind(c("GO:0004368","glycerol-3-phosphate dehydrogenase (quinone) activity",0.0346519324309433,4.75313510798386,3.49018271044513,4.00125763131223,-3.11677795406007,0.781666918078769,0),
c("GO:0022857","transmembrane transporter",9.00077033858165,-3.27601285574652,7.00895302335184,6.41576671362888,-1.33338458930083,1,0),
c("GO:0043021","ribonucleoprotein complex binding",0.30401299993438,-0.649152235408521,5.0936750234502,4.94438395764084,-2.31220209834683,0.994716580102645,0),
c("GO:0045735","nutrient reservoir",0.0136838504613617,2.73820516605904,-0.573622126040393,3.59780484240429,-2.64765130119371,1,0),
c("GO:0070773","protein-N-terminal glutamine amidohydrolase",0.0058329140350451,6.60310824567167,-1.78980233807495,3.22762964957101,-1.55689678516416,0.938897483011957,0.01870394),
c("GO:0016861","intramolecular oxidoreductase",0.308553550314741,-3.002525632333,-5.69005873455125,4.95082227798782,-2.80886467732482,0.815360863548075,0.02410262),
c("GO:0016830","carbon-carbon lyase",1.06212250411837,2.89267269257212,-5.38756819211641,5.48766289005346,-2.21733629217179,0.844381497824962,0.03209176),
c("GO:0016782","transferase",0.556289987467874,-6.07159200865694,2.35371633047009,5.20679080735971,-1.71732244821014,0.894808394633196,0.03403441),
c("GO:0016853","isomerase",2.51613182565406,-6.79176684175925,-3.55763260361118,5.86222085384865,-1.87379970253764,0.947512662463093,0.04027753),
c("GO:0019825","oxygen binding",0.0793594216403115,-1.28640399304696,7.48784294257001,4.3611042704003,-1.55689678516416,0.995036544524425,0.0420261),
c("GO:0016829","lyase",3.64764458257915,0.812405507655672,7.61729226670905,6.02349979296737,-1.30484906493633,0.945682105071235,0.04738337),
c("GO:0044877","protein-containing complex binding",0.703740387224633,-0.068279867168245,-0.470304499567276,5.30890147451342,-1.46740558277832,0.994550381311256,0.05055619),
c("GO:0016491","oxidoreductase",12.8868214602721,7.31468708869276,0.499538427290084,6.57163279451014,-1.30395629395132,0.938664167388,0.0618235),
c("GO:0008260","3-oxoacid CoA-transferase",0.00924351009700571,-6.35778363264379,0.195833157104623,3.42748610909579,-1.55689678516416,0.869011379463941,0.1655361),
c("GO:0102752","1,4-alpha-glucan branching enzyme",0.026956494305324,-5.36844250813323,4.05619671648519,3.89220594597577,-1.55689678516416,0.889970921052611,0.17874782),
c("GO:0003871"," S-methyltransferase",0.0335012450057833,-3.89426931949859,2.25446902592158,3.98659260682221,-1.55689678516416,0.896307477938352,0.18169275),
c("GO:0008941","nitric oxide dioxygenase",0.0143542209132567,3.59497636222418,5.08751337475168,3.61857102812013,-1.55689678516416,0.868836005386817,0.2122824),
c("GO:0051213","dioxygenase",0.62981649507314,3.79376881433584,3.95488068591948,5.26070327992093,-1.3843591398744,0.860800333981586,0.27386407),
c("GO:0042085","methyltransferase",0.0335012450057833,-3.91803047013216,1.68183076092687,3.98659260682221,-1.55689678516416,0.896307477938352,0.43382691),
c("GO:0008824","cyanate hydratase",0.00656893932501229,2.6452635018747,-5.85239584673562,3.2792105126014,-1.55689678516416,0.883556943421597,0.45011713),
c("GO:0004351","glutamate decarboxylase",0.0116831056590566,3.61980465406944,-5.2489310112473,3.52917360326172,-1.55689678516416,0.858539896223603,0.46917445),
c("GO:0016901","oxidoreductase",0.0459791197572927,5.11387126800554,3.71172284237841,4.1240801568797,-3.11677795406007,0.828206695110563,0.48220614),
c("GO:0004412","homoserine dehydrogenase",0.0352220928668334,5.00893886136086,4.10037423545653,4.00834462925269,-1.55689678516416,0.830598309019225,0.48270944),
c("GO:0004512","inositol-3-phosphate synthase",0.0144440643758818,-3.49530852581375,-5.40655634392655,3.62128016755041,-1.55689678516416,0.868094547859721,0.49095634),
c("GO:0008418","protein-N-terminal asparagine amidohydrolase",0.00819648820564395,6.67843874191626,-2.11564950086037,3.37529773821734,-1.55689678516416,0.938217532280581,0.5087744),
c("GO:0004062","aryl sulfotransferase",0.00452327279139457,-6.70757821365514,0.0951069921362509,3.11727129565576,-1.55689678516416,0.873162961014454,0.53520315),
c("GO:0003844","1,4-alpha-glucan branching enzyme",0.0329449066410663,-5.68307498161304,3.85827367174115,3.97932069738202,-1.55689678516416,0.888959956844926,0.56934726),
c("GO:0016708","oxidoreductase",0.018089635647785,3.95039910646878,5.19734015059026,3.71899963787872,-1.55689678516416,0.867425785176887,0.57659982),
c("GO:0016860","intramolecular oxidoreductase",0.415895755044978,-3.0136890826527,-5.28930682825637,5.08047496241649,-2.31220209834683,0.841036661669263,0.6374192),
c("GO:0008146","sulfotransferase",0.120860190337522,-6.29925706979788,0.778114859762641,4.54378255702034,-1.55689678516416,0.852705303175423,0.6450503),
c("GO:0016831","carboxy-lyase",0.618641350529695,3.25475937346288,-5.46795413459358,5.25292823747862,-1.97129579959116,0.829133883693427,0.66255705),
c("GO:0004425","indole-3-glycerol-phosphate synthase",0.0290747267126004,3.30167897744978,-5.0449714518194,3.92505412031184,-1.55689678516416,0.851774754794431,0.67984178),
c("GO:0004640","phosphoribosylanthranilate isomerase",0.0297036309509761,-2.63554941934825,-5.68277110178349,3.93434692673826,-1.55689678516416,0.834353618113192,0.78541503),
c("GO:0004807","triose-phosphate isomerase",0.0407059996047579,-2.82378302918342,-5.90602997944273,4.07118215599008,-1.55689678516416,0.831682417636125,0.8036294));

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
readr::write_tsv(one.data, "~/GitHub/CryptoGat201RNASeq_draft_b/GOresults/DR4_WT_MF.csv")

p <- ggplot(one.data, aes(frequency,description,  fill = description))+
  theme(legend.position ="none")+
  geom_bar(stat = "identity")+
  labs(title = "MF dow-regulated at 4hrs",
       x = "Frequency", y = "Acitivty")+
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

