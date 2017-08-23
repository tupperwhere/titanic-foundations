refine <- read_excel("C:/Users/tcournoyer/Downloads/refine.xlsx")

refine$company <- tolower(refine$company)

refine_philips <- agrep("philips", refine$company, max.distance = 3)
refine$company[refine_philips] <- "philips"
refine_azko <- agrep("azko", refine$company, max.distance = 2)
refine_unilever <- agrep("unilever", refine$company, max.distance = 2)
refine$company[refine_unilever] <- "unilever"


refine <- separate(refine, "Product code / number", into = c("product code", "product number"))

refine$product_category <- "Smartphone"
refine$product_category[(refine$`product code` == "x")] <- "Laptop"
refine$product_category[(refine$`product code` == "v")] <- "TV"
refine$product_category[(refine$`product code` == "q")] <- "Tablet"

refine$full_address <- paste(refine$address, ",",refine$city,",",refine$country)


refine$company_philips <- ifelse(refine$company == "philips",1,0)
refine$company_azko <- ifelse(refine$company == "azko",1,0)
refine$company_van_houten <- ifelse(refine$company == "van houten",1,0)
refine$company_unilever <- ifelse(refine$company == "unilever",1,0)

refine$product_smartphone <- ifelse(refine$product_category == "Smartphone",1,0)
refine$product_tv <- ifelse(refine$product_category == "TV",1,0)
refine$product_laptop <- ifelse(refine$product_category == "Laptop",1,0)
refine$product_tablet <- ifelse(refine$product_category == "Tablet",1,0)

write.csv(refine, file = "refine_clean.csv")

