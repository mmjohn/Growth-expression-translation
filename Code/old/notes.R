# BP	GO:0072329	monocarboxylic acid catabolic process	73/2063	94/3395	0.0003303785838	0.02516383546	0.02190931661	acnB/fadE/yagE/yagF/ykgF/prpR/prpB/prpE/mhpA/mhpB/mhpC/mhpD/mhpF/mhpE/fadM/gcl/glxR/glxK/poxB/yciA/paaE/paaJ/paaK/paaX/paaY/uxaB/hdhA/anmK/ydiJ/ydiR/fadK/fadD/atoB/fadJ/fadI/oxc/hcaE/hcaF/hcaC/hcaB/hcaD/kduD/kduI/yqeF/scpB/glcB/glcD/fadH/uxaA/garD/yheT/gntR/kdgK/dgoT/dgoK/fadA/fadB/acs/idnT/idnO/idnD/idnK/yjhG/yjhH/gntP/uxuA/uxuB/lgoR/lgoD/glcF/glcE/dgoA/dgoD	73																

a <- 73 # genes meeting both criteria
b <- 2063-a # genes neg gci, no go term
c <- 94 - a # genes with go term, no gci
d <- 3395 - a - b - c

#fisher.test(rbind(c(a, b), c(c, d)))
#chisq.test(rbind(c(a,b), c(c,d)))
fisher.test(rbind(c(a, b), c(c, d)), alternative = "greater")

(73/2063)/(94/3395)

# extract odds ratio (a/b)/(c/d)
(a/b)/(c/d)
# 10 with biggest odds ratio
# extract()

tibble(geneRatio = c("73/2063", "65/2063")) %>% 
  tidyr::extract(geneRatio, into = c("A", "B"), regex = "([[:alnum:]]+)/([[:alnum:]]+)")

str_wrap("monocarboxylic acid catabolic process", 20)
