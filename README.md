# Exploratory-data-analysis

---
title: "Exploratory Data Analysis"
author: "W.Lu"
date: "15/01/2020"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## Introduction

According to the customer survey about two different accessorie Brand , Elago and Belkin.

We according to the different factor ( Age ,Salary, Car, Credit , Education Level ,Zipcode ) to analyse the different factor which influence the consuming bahavior more .

As a result , we see findings as following.

1. In education factor, the customers who has level 2 and 3 consume more products .
2. In salary factor, the middle salary level (2500 ~ 10000) prefer brand Belkin more .The high salary level (> 10000) prefers Brand Elago.
3. In macro data ,high salary customer has lower credit .
4. In age group (< 30),the most customers buying Brand Elago, espicially for the customers has the Elevel 4. For Brank Belkin, could take attention for the following subgroup , which prefers belkin more than Elago. 

   ---> Age 25-30 
   (Elevel 3,Zipcode 1)
   (Elevel 3,Zipcode 7)
   (Elevel 3,Zipcode 8)
   (Elevel 2,Zipcode 3)
   (Elevel 2,Zipcode 7)
   (Elevel 2,Zipcode 8)

   ---> Age 0-25 
   (Eleve2 3,Zipcode 6)
   (Eleve1 3,Zipcode 4)
   (Eleve1 3,Zipcode 6)

5. In age group (30-60),the most customers buying Brand Elago from Elevel 1 and 4. 

6. In age group (>60),the most customers buying Brand Belkin.

7. In all customer group. The customers buying bit more Brand Elago products than Brand Belkin products.
