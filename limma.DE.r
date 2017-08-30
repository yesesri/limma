library(limma)
raw.data <- read.delim("C:\\Users\\cherukuri\\Desktop\\fall_2015\\biostat\\assgn\\assgn2\\question_1\\q2_ii\\Q1_expression_matrix")
d <- raw.data[, 2:7]
rownames(d) <- raw.data[, 1]
phenofile<-read.delim("C:\\Users\\cherukuri\\Desktop\\fall_2015\\biostat\\assgn\\assgn2\\question_1\\q2_ii\\Q1_phenomatrix")
Group<-factor(phenofile$Status,levels=levels(phenofile$Status))
design<-model.matrix(~0+Group)
colnames(design)<-c("Normal", "Tumor")
fit = lmFit(d,design)
fit = eBayes(fit)
x<-topTable(fit,number=10,coef =2)
x
write.table(x,file="C:\\Users\\cherukuri\\Desktop\\fall_2015\\biostat\\assgn\\assgn2\\question_1\\q2_ii\\q1_topgenelist_new.txt",sep="\t")

