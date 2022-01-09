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
revigo.data <- rbind(c("GO:0008643","carbohydrate transport",0.710265465446356,1.86484028470191,2.8283385682271,5.23411469124198,-2.47715397836444,1,0),
c("GO:0042254","ribosome biogenesis",1.70477383405889,-6.23000148555171,2.39973301802796,5.61435928548367,-6.97157688676342,0.640123977142823,0),
c("GO:0051409","response to nitrosative stress",0.0161077469065296,1.45534585533904,5.92634765620204,3.58983794314746,-1.55689678516416,0.967906273634543,0),
c("GO:0016072","rRNA metabolic process",1.23456682713927,-5.48923828208492,-3.35025959770941,5.47420751980403,-5.56804265409426,0.638995967911048,0.01286571),
c("GO:1901568","fatty acid derivative metabolic process",0.037282308233503,0.285369273717155,-8.08162697470058,3.95424250943932,-1.55689678516416,0.947382280520635,0.04263998),
c("GO:0006072","glycerol-3-phosphate metabolic process",0.124673463903857,-2.29166395348417,7.06551190618777,4.47847991663581,-2.35459834147482,0.908514259839184,0.05803775),
c("GO:0006020","inositol metabolic process",0.0635568274930736,4.25870405158147,-3.24315123524882,4.18588197840998,-1.97255938664189,0.84642114753408,0.05918107),
c("GO:0005975","carbohydrate metabolic process",5.93663689633546,-2.18083821152349,-8.20159130260653,6.15623224910857,-1.81812242495898,0.901377550336385,0.0963776),
c("GO:0046952","ketone body catabolic process",0.0113972252417343,4.30749312241866,-0.387227306489113,3.43964842956347,-1.55689678516416,0.791726151824379,0.1892243),
c("GO:0046950","cellular ketone body metabolic process",0.0136592699462006,2.94312367091151,-5.48720319291117,3.5182506513085,-1.55689678516416,0.886934268081949,0.1913313),
c("GO:0009086","methionine biosynthetic process",0.340272010461418,3.37417097285586,-3.83026013548849,4.91452297387597,-1.61606599155613,0.763452677940922,0.23849356),
c("GO:0035874","cellular response to copper ion starvation",0.000232004585073471,2.25558637912808,5.63284632639413,1.75587485567249,-1.55689678516416,0.942877478058348,0.26693242),
c("GO:0009439","cyanate metabolic process",0.00792129940465138,0.74257117906917,-4.0279349913875,3.2817149700273,-1.55689678516416,0.8203780749369,0.28622716),
c("GO:1990884","RNA acetylation",0.00831902155049161,-5.96418083156331,-4.46762569357208,3.30297993674825,-1.55689678516416,0.773465569502376,0.33564815),
c("GO:0052646","alditol phosphate metabolic process",0.13283505377162,-1.80215519060464,6.9755106007831,4.50601769985113,-2.35459834147482,0.908171693104186,0.38476754),
c("GO:0016051","carbohydrate biosynthetic process",1.19801781911216,5.48564527287605,-2.81001127037648,5.4611562387117,-1.77320161287867,0.874334895247071,0.45078728),
c("GO:0051391","tRNA acetylation",0.00814501811168651,-6.27580942731585,-3.55231832876628,3.29380435991934,-1.55689678516416,0.722957151718435,0.45175381),
c("GO:0120126","response to copper ion starvation",0.000232004585073471,2.57659608181654,5.47809264762777,1.75587485567249,-1.55689678516416,0.951629734375777,0.54106887),
c("GO:0034660","ncRNA metabolic process",3.89396909881216,-5.02729236333672,-3.91721545853658,5.97308442197989,-3.66154304368475,0.658593658756661,0.60576959),
c("GO:0044085","cellular component biogenesis",4.96569770780298,-6.04543342099504,3.08163855482734,6.07867209934627,-3.76658042497106,0.738592711329139,0.61768411),
c("GO:0000466","maturation of 5.8S rRNA",0.0455847580279179,-5.92808193580787,-0.289258197507517,4.04155058171765,-4.67966533535359,0.551267089972896,0.6590384),
c("GO:0000463","maturation of LSU-rRNA",0.0459990519298349,-6.06662610332333,-0.579699462601022,4.04547945311078,-4.08654648078893,0.539753464228481,0.65954559),
c("GO:0000460","maturation of 5.8S rRNA",0.0511321533745854,-5.64806594253627,-0.456534439522897,4.09142072899205,-4.67966533535359,0.548057756735474,0.66553474),
c("GO:0022613","ribonucleoprotein complex biogenesis",1.9202315206898,-5.7924040389998,2.79084641436957,5.66604599050765,-5.94323698055788,0.704123930256937,0.71120418),
c("GO:0006396","RNA processing",3.97336852511454,-4.81432073073792,-3.76957631369281,5.98185075916945,-2.30259488931542,0.657997674287901,0.71518822),
c("GO:0042273","ribosomal large subunit biogenesis",0.189730035321869,-5.97494425029085,2.43260056699731,4.66083702983534,-3.79324698783229,0.687579920226393,0.74993715),
c("GO:0042274","ribosomal small subunit biogenesis",0.243741531314777,-6.49854987011881,2.4321006777037,4.76962837616023,-1.83435520984228,0.682097763249781,0.76855863),
c("GO:0034470","ncRNA processing",2.74101402741151,-5.19646600330778,-3.40187784630218,5.8206033736402,-4.04933473582667,0.615248028672119,0.78068802),
c("GO:0000470","maturation of LSU-rRNA",0.0605697684602527,-5.87618337119391,-0.682002233618931,4.16497707711089,-3.69753648457086,0.532061350011619,0.82889449),
c("GO:1902224","ketone body metabolic process",0.013791843994814,5.066166061728,1.39837899276681,3.52244423350632,-1.55689678516416,0.841299970434911,0.87837111),
c("GO:1901569","fatty acid derivative catabolic process",0.0128431109594243,5.01271410252714,1.57282697531873,3.49150176623733,-1.55689678516416,0.853143708424861,0.8842488),
c("GO:0006555","methionine metabolic process",0.364620063077075,2.89659360877143,-4.13630776830969,4.94453695556776,-1.44772763119336,0.770556710388944,0.88763183));

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
readr::write_tsv(one.data, "~/GitHub/CryptoGat201RNASeq_draft_b/GOresults/DR4_WT_BP.csv")

p <- ggplot(one.data, aes(frequency, description, fill = description))+
  theme(legend.position ="none")+
  geom_bar(stat = "identity")+
  labs(title = "BP dow-regulated at 4hrs",
       x = "Frequency", y = "Process")+
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


