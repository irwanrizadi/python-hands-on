#memanggil data
data=read.csv('C:/Users/Nikita Dwie S/Documents/KERJA/PEER/No. 1/Creditability.csv', sep=',')
head(data)

#Creditability Account.Balance Duration.of.Credit Previous.Credit Purpose
#1             1               1                 18               4       2
#2             1               1                  9               4       0
#3             1               2                 12               2       9
#4             1               1                 12               4       0
#5             1               1                 12               4       0
#6             1               1                  8               4       0
#Credit.Amount Value.Savings.Stocks Length.of.current.employment
#1          1049                    1                            2
#2          2799                    1                            3
#3           841                    2                            4
#4          2122                    1                            3
#5          2171                    1                            3
#6          3398                    1                            4
#Instalment.per.income Sex.Marital.Status Guarantors Duration.in.Current.address
#1                     4                  2          1                           4
#2                     2                  3          1                           2
#3                     2                  2          1                           4
#4                     3                  3          1                           2
#5                     4                  3          1                           4
#6                     1                  3          1                           4
#Most.valuable.asset Age Concurrent.Credits Type.of.apartment
#1                   2  21                  3                 1
#2                   1  36                  3                 1
#3                   1  23                  3                 1
#4                   1  39                  3                 1
#5                   2  38                  1                 2
#6                   1  39                  3                 2
#No.of.Credits.at.this.Bank Occupation No.of.dependents Telephone Foreign.Worker
#1                          1          3                1         1              1
#2                          2          3                2         1              1
#3                          1          2                1         1              1
#4                          2          2                2         1              2
#5                          2          2                1         1              2
#6                          2          2                1         1              2

#mengambil variabel yang digunakan
pop1=subset(data, Account.Balance==4, select=c(Creditability))
pop2=subset(data, Account.Balance!=4, select=c(Creditability))

head(pop1)
head(pop2)

#>head(pop1)
#Creditability
#7              1
#18             1
#27             1
#30             1
#31             1
#32             1
#> head(pop2)
#Creditability
#1             1
#2             1
#3             1
#4             1
#5             1
#6             1

#replikasi bootstrap
boots1=replicate(10000,sum(sample(pop1$Creditability,length(pop1$Creditability),replace=TRUE)))
A=boots1/length(pop1$Creditability)*100

boots2=replicate(10000,sum(sample(pop2$Creditability,length(pop2$Creditability),replace=TRUE)))
B=boots2/length(pop2$Creditability)*100

A
B

pengujian=A-B
plot(density(pengujian))
y=A-B>=25

sum(y)/10000

#> sum(y)/10000
#[1] 0.9642

t.test(pengujian,mu=25,alternative = "greater",conf.level = 0.95)

#One Sample t-test

#data:  pengujian
#t = 182.29, df = 9999, p-value < 2.2e-16
#alternative hypothesis: true mean is greater than 25
#95 percent confidence interval:
#  29.89957      Inf
#sample estimates:
#  mean of x 
#29.94419 