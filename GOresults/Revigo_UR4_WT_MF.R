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
revigo.data <- rbind(c("GO:0003774","cytoskeletal motor",0.349850443462148,-6.78352898380836,-3.42227886232317,5.00537358471606,-1.50740606540025,1,0),
c("GO:0003777","microtubule motor",0.149990205334815,-3.86560800237561,-6.32493209017934,4.63755977136121,-2.00200841580482,1,0),
c("GO:0004553","hydrolase",1.61340890182159,-6.30218372937901,1.30512314511105,5.66923224534367,-3.98096254319235,0.866700971194356,0),
c("GO:0005215","transporter",9.11750118515621,-4.62466534353733,6.28788655094078,6.4213628594402,-4.58417012933865,1,0),
c("GO:0008017","microtubule binding",0.297302384379843,6.14881471547123,2.7965721130075,4.93469030642185,-2.54632672027717,0.895342317098208,0),
c("GO:0046915","transition metal ion TM transporter",0.190464685247424,6.06352569871144,-2.36141450843536,4.74130920889957,-2.24015880280296,0.837488043972659,0),
c("GO:0016209","antioxidant",0.725261352041138,-1.78304349866931,6.52976976599921,5.32198347085718,-1.50740606540025,0.93760134497076,0.00973414),
c("GO:0047131","saccharopine dehydrogenase",0.00250525040012304,2.01778045310865,5.56475984947594,2.86093662070009,-1.40815513388225,0.908418951505956,0.02250997),
c("GO:0050032","L-rhamnonate dehydratase",0.00291645701752255,0.503776586225476,0.534311247546342,2.92685670894969,-1.40815513388225,0.943012357996937,0.02274478),
c("GO:0051998","protein carboxyl O-methyltransferase",0.0840070930722639,0.345031320866889,-6.0386077018907,4.38582068707189,-2.06291519859005,0.761870711841627,0.02956391),
c("GO:0005537","mannose binding",0.00653783966487283,-5.50400289019306,-5.02095115875242,3.2771506139638,-1.40815513388225,0.991923746759858,0.03517644),
c("GO:0016491","oxidoreductase",12.8868214602721,-3.56114412141904,-3.41114388000459,6.57163279451014,-1.3387910688665,0.960868165512089,0.05365751),
c("GO:0004099","chitin deacetylase",0.00587092473077111,-5.67924744538851,3.59280904509037,3.23044892137827,-1.40815513388225,0.944779980454243,0.18544744),
c("GO:0004352","glutamate dehydrogenase",0.0230033819498195,2.30080697126927,6.63722016101146,3.82334379082065,-1.40815513388225,0.934486585213703,0.18816523),
c("GO:0003979","UDP-glucose 6-dehydrogenase",0.037734254302543,1.36638574031315,6.7392433330586,4.03826240710478,-1.40815513388225,0.932895693655277,0.21955202),
c("GO:0030144","alpha-1,6-mgp 6-beta-N-agat",0.00380452509039375,1.80341232370933,-6.32100676350302,3.04218159451577,-1.40815513388225,0.884437819045096,0.23338804),
c("GO:0140103","catalytic",0.0303359907071451,-1.15825007389159,-6.83045357897414,3.9434945159061,-1.40815513388225,0.923437077912834,0.26530264),
c("GO:0016798","hydrolase",2.10602060739502,-6.14720918449672,2.3424467993745,5.78495019542463,-3.52295751441866,0.9200094102239,0.32202895),
c("GO:0048040","UDP-glucuronate decarboxylase",0.0205776084589417,-0.219532501310607,0.0327548595532311,3.77495468908014,-1.40815513388225,0.94534533519703,0.33704136),
c("GO:0005520","insulin-like growth factor binding",0.0208125836688843,6.12288145685057,2.222433441838,3.77988496319264,-1.40815513388225,0.922031351316566,0.41241152),
c("GO:0004731","purine-nucleoside phosphorylase",0.0723965532868661,2.7620533951868,-5.78506274249071,4.32122548541718,-1.40815513388225,0.886910210270599,0.41485787),
c("GO:0019838","growth factor binding",0.0398766753343723,5.80386765251001,3.22139814148956,4.06224344102648,-1.40815513388225,0.919093322154935,0.43206398),
c("GO:0008869","galactonate dehydratase",0.00633396411506971,0.726517588165486,-0.0214705036071666,3.263399331334,-1.40815513388225,0.941449547658274,0.45454315),
c("GO:0022857","transmembrane transporter",9.00077033858165,6.38046446739242,-2.11107862568977,6.41576671362888,-4.83194934365235,0.854286706871812,0.50202574),
c("GO:0008171","O-methyltransferase",0.274281724841057,0.975735560373235,-5.03699479559472,4.89968920969211,-1.3407796776939,0.842595765883661,0.53482058),
c("GO:0008092","cytoskeletal protein binding",0.901755378850358,5.78360038549628,2.6784951358038,5.41657727212062,-1.32305792806242,0.903021696333569,0.56006293),
c("GO:0015299","solute:proton antiporter",0.179997921851599,6.24885985916931,-2.61031244504757,4.71676269473954,-1.68749283384701,0.818244751121774,0.59981678),
c("GO:0103025","alpha-amylase",0.0239225496828301,-6.4480067048726,0.498036612825634,3.84035705920336,-2.06291519859005,0.891196659724995,0.6063526),
c("GO:0032542","sulfiredoxin",0.00268148180757998,-0.532950149794747,6.30778041151058,2.89042101880091,-1.40815513388225,0.897217260550635,0.60841148),
c("GO:0004556","alpha-amylase",0.0267906294512468,-6.69052828714919,0.868008273175608,3.88952579667119,-2.06291519859005,0.89053263232423,0.61191117),
c("GO:0004130","cytochrome-c peroxidase",0.00316525429863822,-0.460554143636964,6.64803211947139,2.96236933567002,-1.40815513388225,0.896460646335502,0.6150127),
c("GO:0016160","amylase",0.0339573733544954,-6.08619356695118,0.798843604068257,3.99246514780804,-2.06291519859005,0.889121679297137,0.62388477),
c("GO:0017061","S-methyl-5-thioadenosine phosphorylase",0.0373817914876291,2.99903794700736,-5.646828067596,4.03418712079345,-1.40815513388225,0.890232730497442,0.67649481));

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
readr::write_tsv(one.data, "~/GitHub/CryptoGat201RNASeq_draft_b/GOresults/UR4_WT_MF.csv")

p <- ggplot(one.data, aes(frequency, description, fill = description))+
  theme(legend.position ="none")+
  geom_bar(stat = "identity")+
  labs(title = "MF up-regulated at 4hrs",
       x = "Frequency", y = "Acitivty")+
  theme(text = element_text(size = 20))+
  theme(axis.text.y = element_text(size=8))+
  scale_color_brewer(palette="Set1")

print(p)

#alpha-1,6-mannosylglycoprotein 6-beta-N-acetylglucosaminyltransferase = alpha-1,6-mgp 6-beta-N-agat
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

