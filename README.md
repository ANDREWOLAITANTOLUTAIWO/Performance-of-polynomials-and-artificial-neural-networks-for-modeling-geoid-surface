INTRODUCTION

Two height systems are used for mapping, navigation and engineering developments – orthometric height and ellipsoidal height. Orthometric height references the geoid or equipotential surface, which almost coincide with the mean sea level, while ellipsoidal height references the surface of an ellipsoid, the World Geodetic System 1984 (WGS 84). Orthometric height is the classical height system to which mapping and engineering activities are based. It is tied to a physical phenomenon, the mean sea level. But ellipsoidal height is not based on any physical feature, and therefore not reliable. However, Global Positioning System (GPS) produces ellipsoidal height. Since the use of GPS is pervasive in modern mapping, navigation, engineering developments and other geospatial activities, there is need to convert ellipsoidal heights to orthometric heights. This conversion can be achieved by adding geoid heights to ellipsoidal heights. 

Moreover, the ellipsoid is easily modelled through GPS measurements at any point on the earth surface. The geoid is not easily modelled. This is because height differences based on mean seal level (or the geoid surface) need to be extended from points of known orthometric heights through spirit levelling, a task which is very tedious, time consuming, labour intensive, expensive, and difficult to carry through inaccessible remote areas. 

In order to overcome this problem, researchers have proposed various polynomials which model local geoidal surface, and through which orthometric heights at some known points can be interpolated to other known points. Different polynomials best model different local regions with particular uncertainty (Nwilo et al., 2009; Odumosu et al., 2016; Erol, 2011, Oluyori et al., 2020). The development of local geoid surfaces aims basically at providing GPS users with an optimal transformation model between ellipsoidal heights and orthometric heights with respect to a given levelling datum. For a general discussion regarding theoretical and practical aspects of this problem, see Featherstone (1998). 

These surfaces are also called geometric geoid surfaces (Eteje et al., 2018). They are mathematical interpolation surfaces fitted to existing geoid heights to enable geoid heights of new points to be determined using variables such as geographic or rectangular coordinates of the points. These surfaces include plane surface, bi-linear surface, second degree polynomial, third degree polynomial and fifth degree polynomial. The surface to be adopted as well as the degree and order of the polynomial depends on the size of the study area and the variation of the geoid heights. For a small area, the plane surface is used, for a relatively large area, the second and third order polynomial surfaces are used.

Nwilo et al., (2009) carried out geoid modelling technique based on geometrical interpolation approach. A one-degree polynomial of type equation (2) model was formulated using orthometric and ellipsoidal heights. From the analysis, it was observed that the use of the lower order polynomial to model the geoid surface gave the mean square errors of 0.060m.
Olaleye et. al., (2013) adopted the method of ‘satlevel’, in which the ellipsoidal height is used along with Orthometric height to model the geoid. They developed a one-degree, four-term polynomial model using least squares method from the combination of Orthometric and ellipsoidal heights along with space rectangular coordinates. They discovered through statistical tests and goodness of fit analysis that there is no significant difference between the values obtained with the derived model and observed values.

Odumosu et al., (2016) developed an empirical geoid model for Lagos State based on gravimetric and GPS levelling data. They calculated geoid heights by two methods – gravimetric geoid computation by evaluating Stoke’s integral and a one-degree polynomial of type equation (2). They compared the two results and got root mean square errors of 0.090m. 

Recently, artificial neural networks models are employed in modeling local geoid surfaces and found to give better accuracies (Gullu et al., 2011, Akari et al., 2020, Cakir et al., 2014). Several soft computing methods have been applied as alternative techniques to produce accurate results in the prediction of geoid undulation, including the artificial neural network (ANN), least square support vector machines (LS-SVM), and adaptive neuro-fuzzy inference systems (ANFIS). Among these methods, the ANN has been found to produce reliable results (Konakoglu and Akar, 2021). Several researches have studied the performance of ANN with a different network topology in the modeling of a local geoid surface (Lin, 2007; Akcin and Celik, 2013; Erol and Erol, 2013; Albayrak et al., 2020). 

The global geoid models such as Earth Geopotential Model 2008 (EGM08) make geoid height available globally. Since they are not regional or local, the global geoid models have a disadvantage that the geoid heights they provide are not reliable for mapping and engineering development locally. EGM08 global geoid model provides undulation values N with an uncertainty of ±37cm and ±22cm respectively (Gomaa D., et al, 2010). Okiwelu (2011) found them to be between 16cm and 25cm in Nigeria. This is a good reason for creating local and regional geoid models.

MATERIALS AND METHODOLOGY

Data

Two datasets were used in this study. The first dataset was sourced from the Office of the State Surveyor General of Lagos State. The dataset was derived from comprehensive mapping of the state carried out in 2010. It comprises coordinates, orthometric heights and ellipsoidal heights of 1,165 control points (first-order, second-order and third-order) distributed across the state. 

The second dataset is the geoid heights of those control points derived from EGM08 model. It was downloaded from University NAVSTAR Consortium (UNAVCO) website at https://www.unavco.org/software/geodetic-utilities/geoid-height-calculator/geoid-height-calculator.html. 

Performance Metrics

In assessing the performance of geometric surface model in a particular region, several tests can be applied to the results of the least-squares adjustment. Fotopoulos (2003), Lambrou and Pantazis (2005), and Alevizakolu and Lambrou (2011) suggested the following: 
1. root mean square error (RMSE), 
2. goodness of fit, 
3. cross-validation,  
4. testing of parameter significance, and
5. testing for the necessity of a surface of higher degree

Coding the Surface Models

An adjustment program (called geoid_polynomial_surface_lagos.m) was written MathLab® by this author, which implements polynomial surfaces by outputting their adjusted parameters and stochastic properties. Another program (called geoid_surface_lagos,ipynb) was written by the same author in JupyterLab® to implements MLP model and GRNN model. GRNN was implemented using pyGRNN library developed by GKDD (Geosciences and Knowledge Discovery in Data) research group of the University of Lausanne, Switzerland (https://github.com/federhub/pyGRNN). 
Four functions named training, testing, complete_prediction and evaluation were hard-coded in JupyterLab and called each time a surface model was going to be implemented. Training trains the ANN model, fitting it with the training data so it learns the relationships among the features in the data. Testing predicts new values of the target variable. The performance of the model when fed with the test dataset shows how it will perform when it encounters new data in the world (Taiwo et al., 2023). In complete_prediction, the entire dataset is employed in prediction and the output is stored in a csv file. The function evaluation assesses the model performance with RMSE and R2. 
The coefficients of each polynomial surface model were computed in Microsoft Excel® worksheet from the observed dataset and stored in different csv file. For example, multiquadratic polynomial surface is stored in geoid_surface_multiquadratic.csv. Each of the files holds the data input for the MLP and GRNN models, and is called into the codes. 

GRNN is coded with cross validation GridSearchCV in order to search through various values of sigma (σ) and use the value that gives output with the smallest RMSE.

The two error metrics – RMSE and R2 – are hard-coded in a function called evaluation written with Python in JupyterLab®. Each time MLP or GRNN is modeled, it calls evaluation function, which outputs the evaluation metrics RMSE and R2. 

RESULTS AND DISCUSSION

geoid_polynomial_surface_lagos.m code output adjusted parameters ai, RMSE and R2 for each surface model. The parameters so obtained were used to form the mathematical model. 
geoid_surface_lagos,ipynb code output RMSE and R2 for both MLP and GRNN. It should be noted that ANN models do not output parameters. Hence, unlike polynomial models, there is no mathematical model to represent the MLP and GRNN model outputs. However, like other machine learning models, ANN are good at prediction. Thus, both MLP and GRNN produced predicted or interpolated values of N, the precision of which is measured by RMSE. 
According to Wang (2016), global gravity models, such as EGM08, can be used to compute geoid heights to an accuracy of a few centimeters. Results of polynomial geoid surface and ANN geoid surface are compared to geoid heights computed using EGM08. 

Accuracies of the Modeling

RMSE and R2 values, outputs of the program described above, are listed in Table 4 and Table 5. The R2 values show that all the polynomials well fitted the data. It can also be seen that quintic polynomial gives the highest accurate prediction with lowest RMSE. Thus, in this study, Lagos geoid surface shall be modeled with quintic five-degree polynomial. It should be noted in Table 5 that the four polynomials provided input into the ANN models successively. This was done so as to observe how increase in the number of features influence the model performance. The number of terms in the polynomials provided the number of features input into the models. It should be recalled from equations (2), (3), (4) and (5) that plane surface, multiquadratic, third degree and quintic polynomials have 3, 8, 9 and 21 terms respectively. Hence, each provided 3, 8, 9 and 21 features in the ANN models respectively. It is a known fact that machine learning models tend to perform better with increase in number of features (Taiwo et al., 2023).

Enrichment of global geoid models such as EGM08 is necessary to remove systematic errors and local abnormalities inherent in the geoid heights values produced by the models. The values of the geoid heights N produced by EGM08 were adjusted with geoid height values which were determined (or observed) by Lagos State mapping. This is necessary to enrich the global model with terrestrial data. Thus, the global model will provide more accurate values of geoid heights in Lagos State. 

Comparing with the Accuracies Achieved in Existing Studies 

The accuracy achieved with the method described in this study is better than the accuracies of similar studies reported in literature. Nwilo et al., (2009) got RMSE of 6cm. Odumosu et al., (2016) achieved RMSE of 9cm. In a study by Oluyori et al. (2019) in developing geoid model used for transforming ellipsoidal to orthometric heights via GPS levelling experimented with multiquadratic and bi-cubic polynomials. RMSE of the multiquadratic was ±11 cm and that of bi-cubic was of ±14 cm. Odumosu et al., (2016) developed empirical geoid model along with gravimetric geoid model for Lagos State. The obtained gravimetric geoid had a RMSE of 2.37cm when compared with GPS/Levelling geoid of the same area. Olaleye et al., (2013) got RMSE of 15cm using a plane surface polynomial. 

CONCLUSION

This study models the local geoid surface in Lagos State Nigeria with 2-, 3-, 4- and 5-degree polynomials, and two ANN models: MLP and GRNN, using observed geoid heights sourced from the Office of the State Surveyor General and EGM08-derived geoid heights. The results were compared. EGM08-derived geoid heights were enriched with the observed geoid heights in order to make it more accurately represent the local geoid. Performance of these models in optimally representing the geoid in the study area was investigated. Quintic polynomial model produced the lowest RMSE of 1cm. When applied to GRNN, the ANN model performed with an RMSE of 1.5cm. 
