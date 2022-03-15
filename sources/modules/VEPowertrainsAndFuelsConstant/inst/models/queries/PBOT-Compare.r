QuerySpec <- list(

  #===========================================================
  #Metro Measures
  #===========================================================

  #Urban Population in Marea
  #------------------------------------
  list(
    Name = "UrbanHhPop_Ma",
    Summarize = list(
      Expr = "sum(HhSize)",
      Units = c(
        HhSize = "",
        Marea = ""
      ),
      By = "Marea",
      Table = "Household"
    ),
    Units = "Persons",
    Description = "Number of persons residing in urban area"
  ),


  #Number of households in urban area
  #--------------------------------------
  list(
    Name = "UrbanHhNum_Ma",
    Summarize=list(
      Expr = "count(HhSize)",
      Units = c(
        HhSize = "",
        Marea = ""
      ),
      By = "Marea",
      Table = "Household"
    ),
    Units = "Households",
    Description = "Number of households residing in urban area"
  ),

  #Number of 1 person Households
  #------------------------------------------

  list(
    Name = "UrbanHh_1_Ma",
    Summarize=list(
      Expr = "count(HhSize[HhSize==1])",
      Units = c(
        HhSize = "",
        LocType = "",
        Marea = ""
      ),
      By = "Marea",
      Table = "Household"
    ),
    Units = "Households",
    Description = "Number of 1 person Households in urban area"
  ),

  #Percent 1 person HH
  #----------------------------------------

  list(
    Name = "UrbanHh_1per_Ma",
    Function = "UrbanHh_1_Ma / UrbanHhNum_Ma",
    Units = "percent",
    Description = "percent 1 person households"
  ),

  #Total annual household income in urban area
  #--------------------------------------------------

  list(
    Name = "UrbanTotalHhIncome_Ma",
    Summarize=list(
      Expr = "sum(Income)",
      Units = c(
        Income = "USD",
        LocType = "",
        Marea = ""
      ),
      By = "Marea",
      Table = "Household"
    ),
    Units = "USD per year",
    Description = " Total annual household income in urban area"
  ),

  #HH Income Per Capita
  #--------------------------------------------------------------------
  list(
    Name = "UrbanTotalHhIncome_PC",
    Function = "UrbanTotalHhIncome_Ma/UrbanHhPop_Ma",
    Units = "USD per year per person",
    Description = "Total annual household income per person in urban area"
  ),

  #Average annual household income in urban area
  #--------------------------------------------------

  list(
    Name = "UrbanAveHhIncome_Ma",
    Function = "UrbanTotalHhIncome_Ma / UrbanHhNum_Ma",
    Units = "USD per year",
    Description = "Average annual household income in the urban area"
  ),

  #Total annual low household income in urban area
  #---------------------------------------------------
  list(
    Name = "UrbanTotalHhIncomeLowInc_Ma",
    Summarize=list(
      Expr = "sum(Income)",
      Units = c(
        Income = "USD",
        LocType = "",
        Marea = ""
      ),
      By = c(
        "Income",
        "Marea"
      ),
      Breaks = list(
        Income = c(20000,40000,60000,80000,100000)
      ),
      Table = "Household"
    ),
    Units = "USD per year",
    Description = " Total annual low household income (0to20K 2010$) in urban area"
  ),

  #Number of low income households in urban area
  #-------------------------------------------------
  list(
    Name = "UrbanHhNumLowInc_Ma",
    Summarize=list(
      Expr = "count(HhSize)",
      Units = c(
        HhSize = "",
        LocType = "",
        Income = "USD",
        Marea = ""
      ),
      By = c(
        "Income",
        "Marea"),
      Breaks = list(
        Income = c(20000, 40000, 60000, 80000, 100000)
      ),
      Table = "Household"
    ),
    Units = "Households",
    Description = "Number of low income (0to20K 2010$) households residing in urban area"
  ),

  #Average annual low household income in urban area
  #-----------------------------------------------------
  list(
    Name = "UrbanAveHhIncomeLowInc_Ma",
    Function = "UrbanTotalHhIncomeLowInc_Ma / UrbanHhNumLowInc_Ma",
    Units = "USD per year",
    Description = "Average annual low household income (0to20K 2010$) in the urban area"
  ),

  ###_Vehicles&Fuels_###

  #Household Number of vehicles in urban area
  #-----------------------------------------------
  list(
    Name = "UrbanHhVehicles_Ma",
    Summarize=list(
      Expr = "sum(NumAuto) + sum(NumLtTrk)",
      Units = c(
        NumAuto = "VEH",
        NumLtTrk = "VEH",
        LocType = "",
        Marea = ""
      ),
      By = "Marea",
      Table = "Household"
    ),
    Units = "Household light-duty vehicles",
    Description = "Total number of light-duty vehicles owned/leased by households residing in urban area"
  ),

  #Household Number of Autos
  #-------------------------------------

  list(
    Name = "UrbanHhVehicles_Auto_Ma",
    Summarize=list(
      Expr = "sum(NumAuto)",
      Units = c(
        NumAuto = "VEH",
        LocType = "",
        Marea = ""
      ),
      By = "Marea",
      Table = "Household"
    ),
    Units = "Household Autos",
    Description = "Total number of Autos owned/leased by households residing in urban area"
  ),

  #Household Number of vehicles in urban area
  #--------------------------------------------------------
  list(
    Name = "UrbanHhVehicles_LtTrk_Ma",
    Summarize=list(
      Expr = "sum(NumLtTrk)",
      Units = c(
        NumLtTrk = "VEH",
        LocType = "",
        Marea = ""
      ),
      By = "Marea",
      Table = "Household"
    ),
    Units = "Household LtTrk vehicles",
    Description = "Total number of LtTrk vehicles owned/leased by households residing in urban area"
  ),

  #percent of Light trucks
  #----------------------------------------
  list(
    Name = "UrbanHhVehicles_LtTrkPer_Ma",
    Function = "UrbanHhVehicles_LtTrk_Ma / UrbanHhVehicles_Ma",
    Units = "Household light-truck vehicles per household",
    Description = "Average number of light-Truck vehicles owned/leased by households residing in urban area"
  ),

  ###Average number of vehicles per household in urban area
  #----------------------------------------
  list(
    Name = "UrbanHhAveVehPerHh_Ma",
    Function = "UrbanHhVehicles_Ma / UrbanHhNum_Ma",
    Units = "Household light-duty vehicles per household",
    Description = "Average number of light-duty vehicles owned/leased by households residing in urban area"
  ),

  ###Average vehicle age
  #------------------
  list(
    Name = "Veh_Age_Ma",
    Summarize=list(
      Expr = "mean(Age[VehicleAccess=='Own'])/365",
      Units = c(
        Age = "",
        VehicleAccess = "",
        Marea = ""
      ),
      By = "Marea",
      Table = "Vehicle"
    ),
    Units = "Years",
    Description = "average age of household vehicles"
  ),

  ###proportion of plug in vehicles relative to all electric vehicles
  #------------------
  list(
    Name = "Veh_phev_Ma",
    Summarize=list(
      Expr = "count(Powertrain[Powertrain=='PHEV'])/count(Powertrain[Powertrain=='HEV'|Powertrain=='PHEV'|Powertrain=='BEV'])",
      Units = c(
        Powertrain = "",
        Marea = ""
      ),
      By = "Marea",
      Table = "Vehicle"
    ),
    Units = "percent",
    Description = "proportion of PHEV versus all electric"
  ),

  ###Average vehicle MPG
  #------------------
  list(
    Name = "Veh_Mpg_Ma",
    Summarize=list(
      Expr = "mean(MPG)",
      Units = c(
        MPG = "",
        Marea = ""
      ),
      By = "Marea",
      Table = "Vehicle"
    ),
    Units = "GGE",
    Description = "average MPG of vehicles"
  ),

  ###Proportion of Biodiesel by transit
  #------------------
  list(
    Name = "Trans_PropBio_Ma",
    Summarize=list(
      Expr = "TransitBiodieselPropDiesel",
      Units = c(
        TransitBiodieselPropDiesel = "",
        Marea = ""
      ),
      By = "Marea",
      Table = "Marea"
    ),
    Units = "percent",
    Description = "percent of biodiesel in diesel"
  ),

  ###Proportion of CNG by transit
  #------------------
  list(
    Name = "Trans_PropCng_Ma",
    Summarize=list(
      Expr = "BusPropCng",
      Units = c(
        BusPropCng = "",
        Marea = ""
      ),
      By = "Marea",
      Table = "Marea"
    ),
    Units = "percent",
    Description = "percent of cng in bus fleet"
  ),

  ###Proportion of Diesel by bus
  #------------------
  list(
    Name = "Trans_PropDesl_Ma",
    Summarize=list(
      Expr = "BusPropDiesel",
      Units = c(
        BusPropDiesel = "",
        Marea = ""
      ),
      By = "Marea",
      Table = "Marea"
    ),
    Units = "percent",
    Description = "percent of diesel in bus fleet"
  ),

  ###Proportion of Gas by bus
  #------------------
  list(
    Name = "Trans_PropGas_Ma",
    Summarize=list(
      Expr = "BusPropGasoline",
      Units = c(
        BusPropGasoline = "",
        Marea = ""
      ),
      By = "Marea",
      Table = "Marea"
    ),
    Units = "percent",
    Description = "percent of Gasoline in bus fleet"
  ),

  ###Fuel Cost
  #------------------
  list(
    Name = "Fuel_Cost_Ma",
    Summarize=list(
      Expr = "FuelCost",
      Units = c(
        FuelCost = "",
        Marea = ""
      ),
      By = "Marea",
      Table = "Azone"
    ),
    Units = "Dollars",
    Description = "Fuel cost by azone"
  ),

  ###Electricity Cost
  #------------------
  list(
    Name = "Elec_Cost_Ma",
    Summarize=list(
      Expr = "PowerCost",
      Units = c(
        PowerCost = "",
        Marea = ""
      ),
      By = "Marea",
      Table = "Azone"
    ),
    Units = "Dollars/KH",
    Description = "Electricity Cost by azone"
  ),

  ###Federal & State Gas Taxes
  #------------------
  list(
    Name = "Gas_Tax_Ma",
    Summarize=list(
      Expr = "FuelTax",
      Units = c(
        FuelTax = "",
        Marea = ""
      ),
      By = "Marea",
      Table = "Azone"
    ),
    Units = "dollars",
    Description = "Fuel taxes by azone"
  ),

  ###Proportion of workers who pay for parking
  #------------------
  list(
    Name = "Prop_Wk_Pay_Ma",
    Summarize=list(
      Expr = "wtmean(PropWkrPay,UrbanPop)",
      Units = c(
        PropWkrPay = "",
        UrbanPop = "",
        Marea = ""
      ),
      By = "Marea",
      Table = "Bzone"
    ),
    Units = "Percent",
    Description = "Weighted average of workers that pay for parking"
  ),

  ###Proportion of non workers who pay for parking
  #------------------
  list(
    Name = "Prop_NonWk_Pay_Ma",
    Summarize=list(
      Expr = "wtmean(PropNonWrkTripPay,UrbanPop)",
      Units = c(
        PropNonWrkTripPay = "",
        UrbanPop = "",
        Marea = ""
      ),
      By = "Marea",
      Table = "Bzone"
    ),
    Units = "Percent",
    Description = "Weighted average of workers that pay for parking"
  ),

  ###Number of households in urban-mixed neighborhoods
  #-------------------------------------------------
#   if (isDatasetPresent("LocType", "Bzone", Year, QPrep_ls)) {
#     list(
#       Name = "NumUrbanMixHh_Ma",
#       Summarize=list(
#         Expr = "sum(IsUrbanMixNbrhd)",
#         Units = c(
#           IsUrbanMixNbrhd = "",
#           LocType = "category",
#           Marea = ""
#         ),
#         By = "Marea",
#         Table = "Household",
#       )    ),
#   } else {
  list(
    Name = "NumUrbanMixHh_Ma",
    Summarize=list(
      Expr = "sum(IsUrbanMixNbrhd)",
      Units = c(
        IsUrbanMixNbrhd = "",
        Marea = ""
      ),
      By = "Marea",
      Table = "Household"
    ),
    Units = "Households",
    Description = "Number of households residing in urban-mixed neighborhoods in urbanized area"
  ),

  ###Proportion of households in urban-mixed neighborhoods
  #-----------------------------------------------------
  list(
    Name = "PropUrbanMixHh_Ma",
    Function = "NumUrbanMixHh_Ma / UrbanHhNum_Ma",
    Units = "Proportion of Households",
    Description = "Proportion of urbanized area households that reside in urban-mixed neighborhoods"
  ),

  #Number of Multi family units
  #------------------------------------------
  list(
    Name = "UrbanHh_Mf_Ma",
    Summarize=list(
      Expr = "sum(MFDU)",
      Units = c(
        MFDU = "",
        Marea = ""
      ),
      By = "Marea",
      Table = "Bzone"
    ),
    Units = "Households",
    Description = "Number of Multi family dwelling units"
  ),

  #Proportion SOV diverted to Bike
  #---------------------------------------
  list(
    Name = "Prop_Divt_Ma",
    Summarize=list(
      Expr = "PropSovDvmtDiverted",
      Units = c(
        PropSovDvmtDiverted = "",
        Marea = ""
      ),
      By = "Marea",
      Table = "Azone"
    ),
    Units = "percent",
    Description = "proportion SOV diverted to biking"
  ),

  #Total Transit Revenue Miles
  #---------------------------------------
  list(
    Name = "Trans_ReMi_Per_Cap_Ma",
    Summarize=list(
      Expr = "TranRevMiPC",
      Units = c(
        TranRevMiPC = "",
        Marea = ""
      ),
      By = "Marea",
      Table = "Marea"
    ),
    Units = "Miles",
    Description = "Transit Miles"
  ),

  #Freeway Miles
  #-----------------------------------------------------
  list(
    Name = "Frw_Mi_Ma",
    Summarize=list(
      Expr = "FwyLaneMi",
      Units = c(
        FwyLaneMi = "",
        Marea = ""
      ),
      By = "Marea",
      Table = "Marea"
    ),
    Units = "Miles",
    Description = "Freeway Miles"
  ),

  #Arterial Miles
  #-----------------------------------------------------
  list(
    Name = "Art_Mi_Ma",
    Summarize=list(
      Expr = "ArtLaneMi",
      Units = c(
        ArtLaneMi = "",
        Marea = ""
      ),
      By = "Marea",
      Table = "Marea"
    ),
    Units = "Miles",
    Description = "Arterial Miles"
  ),

  #Workers covered by TDM programs
  #-----------------------------------------------------
  list(
    Name = "Wk_TDM_Ma",
    Summarize=list(
      Expr = "wtmean(EcoProp,UrbanPop)",
      Units = c(
        EcoProp = "",
        UrbanPop = "",
        Marea = ""
      ),
      By = "Marea",
      Table = "Bzone"
    ),
    Units = "Percent",
    Description = "Proportion of workers in TDM Programs"
  ),

  #Households covered by TDM programs
  #-----------------------------------------------------
  list(
    Name = "Hh_TDM_Ma",
    Summarize=list(
      Expr = "wtmean(ImpProp,UrbanPop)",
      Units = c(
        ImpProp = "",
        UrbanPop = "",
        Marea = ""
      ),
      By = "Marea",
      Table = "Bzone"
    ),
    Units = "Percent",
    Description = "Proportion of Households in TDM Programs"
  ),

  #Households with high car service
  #-----------------------------------------------------
  list(
    Name = "Hh_HighCSv_Ma",
    Summarize=list(
      Expr = "count(CarSvcLevel[CarSvcLevel=='High'])",
      Units = c(
        CarSvcLevel = "",
        Marea = ""
      ),
      By = "Marea",
      Table = "Household"
    ),
    Units = "Percent",
    Description = "Proportion of Households in TDM Programs"
  ),

  #Ramp Metering
  #-----------------------------------------------------
  list(
    Name = "Rmp_Meter_Ma",
    Summarize=list(
      Expr = "RampMeterDeployProp",
      Units = c(
        RampMeterDeployProp = "",
        Marea = ""
      ),
      By = "Marea",
      Table = "Marea"
    ),
    Units = "Percent",
    Description = "Ramp Metering Strategies"
  ),

  #Incident Deploy
  #-----------------------------------------------------

  list(
    Name = "Inc_Deploy_Ma",
    Summarize=list(
      Expr = "IncidentMgtDeployProp",
      Units = c(
        IncidentMgtDeployProp = "",
        Marea = ""
      ),
      By = "Marea",
      Table = "Marea"
    ),
    Units = "Percent",
    Description = "Ramp Metering Strategies"
  ),

  #Signal Coordination
  #-----------------------------------------------------
  list(
    Name = "Sig_Coord_Ma",
    Summarize=list(
      Expr = "SignalCoordDeployProp",
      Units = c(
        SignalCoordDeployProp = "",
        Marea = ""
      ),
      By = "Marea",
      Table = "Marea"
    ),
    Units = "Percent",
    Description = "Ramp Metering Strategies"
  ),

  #Access Management
  #-----------------------------------------------------
  list(
    Name = "Access_Ma",
    Summarize=list(
      Expr = "AccessMgtDeployProp",
      Units = c(
        AccessMgtDeployProp = "",
        Marea = ""
      ),
      By = "Marea",
      Table = "Marea"
    ),
    Units = "Percent",
    Description = "Ramp Metering Strategies"
  ),

  #FwySmooth
  #-----------------------------------------------------

  list(
    Name = "FwySmooth_Ma",
    Summarize=list(
      Expr = "FwySmooth",
      Units = c(
        FwySmooth = "",
        Marea = ""
      ),
      By = "Marea",
      Table = "Marea"
    ),
    Units = "Percent",
    Description = "Ramp Metering Strategies"
  ),

  #ArtSmooth
  #-----------------------------------------------------
  list(
    Name = "ArtSmooth_Ma",
    Summarize=list(
      Expr = "ArtSmooth",
      Units = c(
        ArtSmooth = "",
        Marea = ""
      ),
      By = "Marea",
      Table = "Marea"
    ),
    Units = "Percent",
    Description = "Ramp Metering Strategies"
  ),

  #-----------------------------------------------------------------------------------------------------_DVMT_-------------------------

  ###Urban area household DVMT
  #--------------------
  list(
    Name = "UrbanHhDvmt_Ma",
    Summarize=list(
      Expr = "sum(UrbanHhDvmt)",
      Units = c(
        UrbanHhDvmt = "MI/DAY",
        Marea = ""
      ),
      By = "Marea",
      Table = "Marea"
    ),
    Units = "Miles per day",
    Description = "Daily vehicle miles traveled by households residing in the urban area"
  ),

  ###Urban area household DVMT
  #--------------------
  list(
    Name = "UrbanHhSocCost_Ma",
    Summarize=list(
      Expr = "mean(AveSocEnvCostPM*Dvmt)*365",
      Units = c(
        AveSocEnvCostPM = "",
        Dvmt = "MI/DAY",
        Marea = ""
      ),
      By = "Marea",
      Table = "Household"
    ),
    Units = "$/Mi",
    Description = "Average Annual HH social costs "
  ),

  ###Urban area household DVMT in mix use
  list(
    Name = "UrbanHhDvmt_MaAzMx",
    Summarize=list(
      Expr = "sum(Dvmt[IsUrbanMixNbrhd == '1'] )",
      Units = c(
        Dvmt = "MI/DAY",
        IsUrbanMixNbrhd = "",
        Marea = ""
      ),
      By = "Marea",
      Table = "Household"
    ),
    Units = "Miles per day",
    Description = "Daily vehicle miles traveled by households residing in mixed use"
  ),

  ###Urban area public transit 'van' DVMT
  #-------------------------------
  list(
    Name = "UrbanVanDvmt_Ma",
    Summarize=list(
      Expr = "sum(VanDvmt)",
      Units = c(
        VanDvmt = "MI/DAY",
        Marea = ""
      ),
      By = "Marea",
      Table = "Marea"
    ),
    Units = "Miles per day",
    Description = "Daily vehicle miles traveled by on-demand transit vans in the Urban area."
  ),

  ###Urban area commercial service vehicle DVMT
  #-------------------------------------
  list(
    Name = "UrbanComSvcDvmt_Ma",
    Summarize=list(
      Expr = "sum(ComSvcUrbanDvmt)",
      Units = c(
        ComSvcUrbanDvmt = "MI/DAY",
        Marea = ""
      ),
      By = "Marea",
      Table = "Marea"
    ),
    Units = "Miles per day",
    Description = "Commercial service vehicle daily vehicle miles traveled attributable to the demand of households and businesses located in the urban area"
  ),

  ###Urban area light-duty vehicle DVMT
  #-----------------------------
  list(
    Name = "UrbanLdvDvmt_Ma",
    Function = "UrbanHhDvmt_Ma + UrbanVanDvmt_Ma + UrbanComSvcDvmt_Ma",
    Units = "Miles per day",
    Description = "Sum of daily vehicle miles traveled by households residing in the urban area, commercial service travel attributable to the demand of urban area households and businesses, and on-demand transit van travel in the urban area."
  ),

  ###Urban Population in mixed use
  #-------------------
  list(
    Name = "UrbanHhPop_MaAzMx",
    Summarize=list(
      Expr = "sum(HhSize[IsUrbanMixNbrhd == '1'])",
      Units = c(
        HhSize = "",
        IsUrbanMixNbrhd = "",
        Marea = ""
      ),
      By = "Marea",
      Table = "Household"
    ),
    Units = "Persons",
    Description = "Number of persons residing in mixed use in urban area"
  ),

  ###Urban Population in mixed use Low Income
  #-------------------
  list(
    Name = "UrbanHhPopLowInc_Ma",
    Summarize=list(
      Expr = "sum(HhSize)",
      Units = c(
        HhSize = "",
        Income = "USD",
        Marea = ""
      ),
      By = c(
        "Income",
        "Marea"),
      Breaks = list(
        Income = c(20000, 40000, 60000, 80000, 100000)
      ),
      Table = "Household"
    ),
    Units = "Persons",
    Description = "Number of persons in low income (0to20K 2010$) households residing in urban area"
  ),

  ###DVMT per Capita in Marea
  list(
    Name = "UrbanLdvDmvtPerCap_Ma",
    Function = "UrbanLdvDvmt_Ma / UrbanHhPop_Ma",
    Units = "Dvmt per person",
    Description = "daily vehicle miles traveled per person residing in the urban area."
  ),

  ###urban DVMT per Capita
  list(
    Name = "UrbanLdvDmvtPerCap_MaAz",
    Function = "UrbanHhDvmt_Ma / UrbanHhPop_Ma",
    Units = "Dvmt per person",
    Description = "daily vehicle miles traveled per person residing in the urban area."
  ),

  ###urban DVMT per Capita in mixed use
  list(
    Name = "UrbanLdvDmvtPerCap_MaAzMx",
    Function = "UrbanHhDvmt_MaAzMx / UrbanHhPop_MaAzMx",
    Units = "Dvmt per person",
    Description = "daily vehicle miles traveled per person residing in mixed use in the urban area."
  ),

  ###Urban area Bus DVMT
  #-------------------------------
  list(
    Name = "UrbanBusDvmt_Ma",
    Summarize=list(
      Expr = "sum(BusFwyDvmt)+ sum(BusArtDvmt) + sum(BusOthDvmt)",
      Units = c(
        BusFwyDvmt = "MI/DAY",
        BusArtDvmt = "MI/DAY",
        BusOthDvmt = "MI/DAY",
        Marea = ""
      ),
      By = "Marea",
      Table = "Marea"
    ),
    Units = "Miles per day",
    Description = "Daily vehicle miles traveled by Bus in the Urban area."
  ),

  ###Urban area Hvy Trk DVMT
  #-------------------------------
  list(
    Name = "UrbanHvyTrkDvmt_Ma",
    Summarize=list(
      Expr = "sum(HvyTrkFwyDvmt)+ sum(HvyTrkArtDvmt) + sum(HvyTrkOthDvmt)",
      Units = c(
        HvyTrkFwyDvmt = "MI/DAY",
        HvyTrkArtDvmt = "MI/DAY",
        HvyTrkOthDvmt = "MI/DAY",
        Marea = ""
      ),
      By = "Marea",
      Table = "Marea"
    ),
    Units = "Miles per day",
    Description = "Daily vehicle miles traveled by Heavy Truck in the Urban area."
  ),

  ###Urban area Rail DVMT
  #-------------------------------
  list(
    Name = "UrbanRailDvmt_Ma",
    Summarize=list(
      Expr = "sum(RailDvmt)",
      Units = c(
        RailDvmt = "MI/DAY",
        Marea = ""
      ),
      By = "Marea",
      Table = "Marea"
    ),
    Units = "Miles per day",
    Description = "Daily vehicle miles traveled by Rail in the Urban area."
  ),

  ###
  ###Annual Fuel Use
  ###Household fuel consumption for Urban
  #------------------------------------
  list(
    Name = "UrbanHhGGE_Ma",
    Summarize=list(
      Expr = "sum(DailyGGE)",
      Units = c(
        DailyGGE = "GGE/DAY",
        LocType = "",
        Marea = ""
      ),
      By = "Marea",
      Table = "Household"
    ),
    Units = "Gas gallon equivalents per day",
    Description = "Average daily fuel consumption for the travel of households residing in the Urban"
  ),

  ###Commercial service fuel consumption for Urban
  #---------------------------------------------
  list(
    Name = "UrbanComSvcGGE_Ma",
    Summarize=list(
      Expr = "sum(ComSvcUrbanGGE )",
      Units = c(
        ComSvcUrbanGGE = "GGE/DAY",
        Marea = ""
      ),
      By = "Marea",
      Table = "Marea"
    ),
    Units = "Gas gallon equivalents per day",
    Description = "Average daily fuel consumption for commercial services vehicle travel arising from households and businesses located in the Urban"
  ),

  #Public transit van fuel consumption for Urban area
  #---------------------------------------------
  list(
    Name = "UrbanVanGGE_Ma",
    Summarize=list(
      Expr = "sum(VanGGE)",
      Units = c(
        VanGGE = "GGE/DAY",
        Marea = ""
      ),
      By = "Marea",
      Table = "Marea"
    ),
    Units = "Gas gallon equivalents per day",
    Description = "Average daily fuel consumption for public transit van in the urban area"
  ),

  #Light-duty vehicle fuel consumption for urban area
  #---------------------------------------------
  list(
    Name = "UrbanLdvGGE_Ma",
    Function = "UrbanHhGGE_Ma + UrbanComSvcGGE_Ma + UrbanVanGGE_Ma",
    Units = "Gas gallon equivalents per day",
    Description = "Average daily fuel consumption for light-duty vehicle travel attributable to households and businesses in the urban area"
  ),

  #Bus fuel consumption for urban area
  #---------------------------------------------
  list(
    Name = "UrbanBusGGE_Ma",
    Summarize=list(
      Expr = "sum(BusGGE)",
      Units = c(
        BusGGE = "GGE/DAY",
        Marea = ""
      ),
      By = "Marea",
      Table = "Marea"
    ),
    Units = "Gas gallon equivalents per day",
    Description = "Average daily fuel consumption for Bus in the urban area"
  ),

  #Rail fuel consumption for urban area
  #---------------------------------------------
  list(
    Name = "UrbanRailGGE_Ma",
    Summarize=list(
      Expr = "sum(RailGGE)",
      Units = c(
        RailGGE = "GGE/DAY",
        Marea = ""
      ),
      By = "Marea",
      Table = "Marea"
    ),
    Units = "Gas gallon equivalents per day",
    Description = "Average daily fuel consumption for Rail in the urban area"
  ),

  #Heavy truck fuel consumption for Urban area
  #---------------------------------------------
  list(
    Name = "UrbanHvyTrkGGE_Ma",
    Summarize=list(
      Expr = "sum(HvyTrkUrbanGGE)",
      Units = c(
        HvyTrkUrbanGGE = "GGE/DAY",
        Marea = ""
      ),
      By = "Marea",
      Table = "Marea"
    ),
    Units = "Gas gallon equivalents per day",
    Description = "Average daily fuel consumption for heavy truck in the urban area"
  ),

  ###
  ### Household vehicle ownership
  #Number of workers in urban
  #--------------------------
  list(
    Name = "UrbanHhWorkers_Ma",
    Summarize=list(
      Expr = "sum(Workers)",
      Units = c(
        Workers = "PRSN",
        LocType = "",
        Marea = ""
      ),
      By = "Marea",
      Table = "Household"
    ),
    Units = "Workers",
    Description = "Number of workers residing in urban"
  ),

  #Number of drivers in urban
  #--------------------------
  list(
    Name = "UrbanHhDrivers_Ma",
    Summarize=list(
      Expr = "sum(Drivers)",
      Units = c(
        Drivers = "PRSN",
        LocType = "",
        Marea = ""
      ),
      By = "Marea",
      Table = "Household"
    ),
    Units = "Drivers",
    Description = "Number of drivers residing in urban"
  ),

  ###
  ### CO2
  #Household CO2e for urban area
  #------------------------
  list(
    Name = "UrbanHhCO2e_Ma",
    Summarize=list(
      Expr = "sum(DailyCO2e)",
      Units = c(
        DailyCO2e = "MT/YR",
        LocType = "",
        Marea = ""
      ),
      By = "Marea",
      Table = "Household"
    ),
    Units = "Metric tons CO2e per year",
    Description = "Average annual production of greenhouse gas emissions from light-duty vehicle travel by households residing in the urban area"
  ),

  #Commercial service CO2e for urban area
  #---------------------------------
  list(
    Name = "UrbanComSvcCO2e_Ma",
    Summarize=list(
      Expr = "sum(ComSvcUrbanCO2e)",
      Units = c(
        ComSvcUrbanCO2e = "MT/YR",
        Marea = ""
      ),
      By = "Marea",
      Table = "Marea"
    ),
    Units = "Metric tons CO2e per year",
    Description = "Average annual production of greenhouse gas emissions from commercial service light-duty vehicle travel attributable to households and businesses in the urban area"
  ),

  #Van CO2e for urban area
  #------------------
  list(
    Name = "UrbanVanCO2e_Ma",
    Summarize=list(
      Expr = "sum(VanCO2e)",
      Units = c(
        VanCO2e = "MT/YR",
        Marea = ""
      ),
      By = "Marea",
      Table = "Marea"
    ),
    Units = "Metric tons CO2e per year",
    Description = "Average annual production of greenhouse gas emissions from public transit van travel in the urban area"
  ),

  #Light-duty vehicle CO2e for urban area
  #---------------------------------
  list(
    Name = "UrbanLdvCO2e_Ma",
    Function = "UrbanHhCO2e_Ma + UrbanVanCO2e_Ma + UrbanComSvcCO2e_Ma",
    Units = "Metric tons CO2e per year",
    Description = "Average annual production of greenhouse gas emissions from light-duty vehicle travel of households and businesses in the urban area"
  ),

  #Light-duty vehicle CO2e Rate for urban area
  #---------------------------
  list(
    Name = "UrbanLdvCO2eRate_Ma",
    Function = "(UrbanLdvCO2e_Ma*1000000) / (UrbanLdvDvmt_Ma * 365)",
    Units = "Grams CO2e per mile",
    Description = "Average greenhouse gas emissions per mile of light duty vehicle travel in the urban area"
  ),

  #Bus CO2e for urban area
  #---------------------------
  list(
    Name = "UrbanBusCO2e_Ma",
    Summarize=list(
      Expr = "sum(BusCO2e)",
      Units = c(
        BusCO2e = "MT/YR",
        Marea = ""
      ),
      By = "Marea",
      Table = "Marea"
    ),
    Units = "Metric tons CO2e per year",
    Description = "Average annual production of greenhouse gas emissions from public transit bus travel in the urban area"
  ),

  #Rail CO2e for urban area
  #---------------------------
  list(
    Name = "UrbanRailCO2e_Ma",
    Summarize=list(
      Expr = "sum(RailCO2e)",
      Units = c(
        RailCO2e = "MT/YR",
        Marea = ""
      ),
      By = "Marea",
      Table = "Marea"
    ),
    Units = "Metric tons CO2e per year",
    Description = "Average annual production of greenhouse gas emissions from Rail travel in the urban area"
  ),

  #Bus CO2e Rate for urban area
  #---------------------------
  list(
    Name = "UrbanBusCO2eRate_Ma",
    Function = "(UrbanBusCO2e_Ma * 1000000) / (UrbanBusDvmt_Ma * 365)",
    Units = "grams CO2e per mile",
    Description = "Average greenhouse gas emissions per mile of public transit bus travel in the urban area"
  ),

  #Heavy Truck CO2e for Urban
  #---------------------------
  list(
    Name = "UrbanHvyTrkCO2e_Ma",
    Summarize=list(
      Expr = "sum(HvyTrkUrbanCO2e)",
      Units = c(
        HvyTrkUrbanCO2e = "MT/YR",
        Marea = ""
      ),
      By = "Marea",
      Table = "Marea"
    ),
    Units = "Metric tons CO2e per year",
    Description = "Average annual production of greenhouse gas emissions from heavy truck travel in the urban area"
  ),

  #Heavy Truck CO2e Rate for urban area
  #---------------------------
  list(
    Name = "UrbanHvyTrkAveCO2eRate_Ma",
    Function = "(UrbanHvyTrkCO2e_Ma * 1000000) / (UrbanHvyTrkDvmt_Ma * 365)",
    Units = "Grams CO2e per mile",
    Description = "Average greenhouse gas emissions per mile of heavy truck travel in the urban area"
  ),

  ###
  ###Trips, Delay, Speed and Mode shift
  #Walk Trips in Urban area
  list(
    Name = "UrbanWalkTrips_Ma",
    Summarize=list(
      Expr = "sum(WalkTrips)",
      Units = c(
        WalkTrips = "TRIP/DAY",
        LocType = "",
        Marea = ""
      ),
      By = "Marea",
      Table = "Household"
    ),
    Units = "Trips per Day",
    Description = "Average number walk trips per day in urban area"
  ),

  #Bike Trips in Urban area
  list(
    Name = "UrbanBikeTrips_Ma",
    Summarize=list(
      Expr = "sum(BikeTrips)",
      Units = c(
        BikeTrips = "TRIP/DAY",
        LocType = "",
        Marea = ""
      ),
      By = "Marea",
      Table = "Household"
    ),
    Units = "Trips per Day",
    Description = "Average number bike trips per day in urban area"
  ),

  #Transit Trips in Urban area
  list(
    Name = "UrbanTransitTrips_Ma",
    Summarize=list(
      Expr = "sum(TransitTrips)",
      Units = c(
        TransitTrips = "TRIP/DAY",
        LocType = "",
        Marea = ""
      ),
      By = "Marea",
      Table = "Household"
    ),
    Units = "Trips per Day",
    Description = "Average number transit trips per day in urban area"
  ),

  #Mode shift Trips in urban area
  #------------------
  list(
    Name = "UrbanModeShiftTrips_Ma",
    Function = "UrbanWalkTrips_Ma+UrbanBikeTrips_Ma+UrbanTransitTrips_Ma",
    Units = "Trips per Day",
    Description = "Average number mode shift trips (Bike, Walk, & Transit) per day in urban area"
  ),

  ###Hours of congestion (total delay of ldv and hvy trk)
  #total delay of ldv in urban area
  #---------------------------
  list(
    Name = "UrbanLdv_TotalDelay_Ma",
    Summarize=list(
      Expr = "sum(LdvTotDelay)",
      Units = c(
        LdvTotDelay = "",
        Marea = ""
      ),
      By = "Marea",
      Table = "Marea"
    ),
    Units = "Hours",
    Description = "Total light-duty vehicle delay (hours per day) on urban area roads"
  ),

  #total delay of hvy trk in urban area
  #---------------------------
  list(
    Name = "UrbanHvyTrk_TotalDelay_Ma",
    Summarize=list(
      Expr = "sum(HvyTrkTotDelay)",
      Units = c(
        HvyTrkTotDelay = "",
        Marea = ""
      ),
      By = "Marea",
      Table = "Marea"
    ),
    Units = "Hours",
    Description = "Total heavy truck vehicle delay (hours per day) on urban area roads"
  ),

  #total delay of ldv and hvy trk in urban area
  #---------------------------
  list(
    Name = "UrbanLdv_HvyTrk_TotalDelay_Ma",
    Function = "UrbanLdv_TotalDelay_Ma + UrbanHvyTrk_TotalDelay_Ma",
    Units = "Hours",
    Description = "Total light duty vehicle and heavy truck delay (hours per day) on the urban area roads"
  ),

  #Light duty vehicle speed in urban area
  #---------------------------
  list(
    Name = "UrbanLvdAveSp_Ma",
    Summarize=list(
      Expr = "mean(LdvAveSpeed)",
      Units = c(
        LdvAveSpeed = "MI/HR",
        Marea = ""
      ),
      By = "Marea",
      Table = "Marea"
    ),
    Units = "Miles per Hour",
    Description = "Average speed (miles per hour) of light-duty vehicle travel on urban area roads"
  ),

  #Heavy truck speed in urban area
  #---------------------------
  list(
    Name = "UrbanHvyTrkAveSp_Ma",
    Summarize=list(
      Expr = "mean(HvyTrkAveSpeed)",
      Units = c(
        HvyTrkAveSpeed = "MI/HR",
        Marea = ""
      ),
      By = "Marea",
      Table = "Marea"
    ),
    Units = "Miles per Hour",
    Description = "Average speed (miles per hour) of heavy truck travel on urban area roads"
  ),

  #Bus speed in urban area
  #---------------------------
  list(
    Name = "UrbanBusAveSp_Ma",
    Summarize=list(
      Expr = "mean(BusAveSpeed)",
      Units = c(
        BusAveSpeed = "MI/HR",
        Marea = ""
      ),
      By = "Marea",
      Table = "Marea"
    ),
    Units = "Miles per Hour",
    Description = "Average speed (miles per hour) of bus travel on urban area roads"
  ),

  ###
  ###Household Transportation Costs as Percentage of Income
  #Vehicle ownership cost in urban area
  #------------------
  list(
    Name = "UrbanVehOwnershipCost_Ma",
    Summarize=list(
      Expr = "mean(OwnCost)",
      Units = c(
        OwnCost = "USD",
        LocType = "",
        Marea = ""
      ),
      By = "Marea",
      Table = "Household"
    ),
    Units = "USD per year",
    Description = "Average annual household vehicle ownership cost (depreciation, finance, insurance, taxes) in urban area"
  ),

  #Vehicle average out-of-pocket cost in dollars per mile of vehicle travel in urban area
  #------------------
  list(
    Name = "UrbanAveVehCostPM_Ma",
    Summarize=list(
      Expr = "wtmean(AveVehCostPM, Dvmt)",
      Units = c(
        AveVehCostPM = "USD",
        LocType = "",
        Dvmt = "MI/DAY",
        Marea = ""
      ),
      By = "Marea",
      Table = "Household"
    ),
    Units = "USD",
    Description = " Average out-of-pocket cost in dollars per mile of vehicle travel in urban area"
  ),

  #Vehicle Operating cost in urban area
  #------------------
  list(
    Name = "UrbanVehOperatingCost_Ma",
    Summarize=list(
      Expr = "mean(AveVehCostPM * Dvmt) *365 ",
      Units = c(
        AveVehCostPM = "USD",
        Dvmt = "MI/DAY",
        LocType = "",
        Marea = ""
      ),
      By = "Marea",
      Table = "Household"
    ),
    Units = "USD per year",
    Description = " Average Annual vehicle operating cost per household in urban area"
  ),

  #Average annual household DVMT in urban area
  #---------------------------------
  list(
    Name = "UrbanAveHhDVMT_Ma",
    Function = "UrbanHhDvmt_Ma / UrbanHhNum_Ma",
    Units = "Vehicle Mile Travel",
    Description = "Average household DVMT in urban area"
  ),

  # Average Household operating cost for low income - Inc0to20K
  list(
    Name = "UrbanVehOperatingCostLowInc_Ma",
    Summarize=list(
      Expr = "mean(AveVehCostPM * Dvmt)*365 ",
      Units = c(
        AveVehCostPM = "USD",
        LocType = "",
        Income = "USD",
        Dvmt = "MI/DAY",
        Marea = ""
      ),
      By = c(
        "Income",
        "Marea"
      ),
      Breaks = list(
        Income = c(20000,40000,60000,80000,100000)
      ),
      Table = "Household"
    ),
    Units = "USD per year",
    Description = "Average annual vehicle operating cost per low income household (0to20K 2010$) in urban area"
  ),

  # Average Household vehicle ownership cost for low income - Inc0to20K
  list(
    Name = "UrbanVehOwnershipCostLowInc_Ma",
    Summarize=list(
      Expr = "mean(OwnCost)",
      Units = c(
        OwnCost = "USD",
        LocType = "",
        Income = "USD",
        Marea = ""
      ),
      By = c(
        "Income",
        "Marea"
      ),
      Breaks = list(
        Income = c(20000,40000,60000,80000,100000)
      ),
      Table = "Household"
    ),
    Units = "USD per year",
    Description = "Average annual household vehicle ownership cost for low income(0to20K 2010$) in urban area"
  ),

  #low income Hh Dvmt in urban area
  list(
    Name = "UrbanHhDvmtLowInc_Ma",
    Summarize=list(
      Expr = "sum(Dvmt)",
      Units = c(
        Dvmt = "MI/DAY",
        LocType = "",
        Income = "USD",
        Marea = ""
      ),
      By = c(
        "Income",
        "Marea"
      ),
      Breaks = list(
        Income = c(20000,40000,60000,80000,100000)
      ),
      Table = "Household"
    ),
    Units = "Miles per day",
    Description = "Daily vehicle miles traveled by low income (0to20K 2010$) households residing in the urban area"
  ),

  #Low income household vehicle Own & out-of-pocket costs share of HH low Income total (all low income HHs)
  list(
    Name = "HhVehTravCostShareLowInc_Ma",
    Function = "(UrbanVehOperatingCostLowInc_Ma  + UrbanVehOwnershipCostLowInc_Ma* UrbanHhNumLowInc_Ma)/ UrbanTotalHhIncomeLowInc_Ma",
    Units = "Proportion",
    Description = "Low income (0to20K 2010$) household vehicle Own & out-of-pocket costs share of HH low income total (all low income HHs)in urban area"
  ),

  #household vehicle Own & out-of-pocket costs share of HH income total (all HHs)
  list(
    Name = "HhVehTravCostShare_Ma",
    Function = "((UrbanVehOperatingCost_Ma + UrbanVehOwnershipCost_Ma)* UrbanHhNum_Ma) / UrbanTotalHhIncome_Ma",
    Units = "Proportion",
    Description = "Household vehicle Own & out-of-pocket costs share of HH income total (all HHs) in urban area"
  ),

  #urban DVMT per Capita in LowInc HHs
  list(
    Name = "UrbanLdvDmvtPerCapLowInc_Ma",
    Function = "UrbanHhDvmtLowInc_Ma / UrbanHhPopLowInc_Ma",
    Units = "Dvmt per person",
    Description = "daily vehicle miles traveled per person in low income (0to20K 2010$) households residing in the urban area."
  ),

  #Average car service light truck proportion of car service DVMT
  #--------------------------------------------------------------
  list(
    Name = "MareaCarSvcLtTrkDvmtProp_Ma",
    Summarize=list(
      Expr = "sum(DvmtProp[VehicleAccess != 'Own' & Type == 'LtTrk']) / sum(DvmtProp[VehicleAccess != 'Own'])",
      Units = c(
        DvmtProp = "",
        VehicleAccess = "",
        Type = "",
        Marea = ""
      ),
      By = "Marea",
      Table = "Vehicle"
    ),
    Units = "Proportion",
    Description = "Average proportion car service vehicle DVMT in light trucks used by households residing in the Marea"
  ),

  #Average population density
  #--------------------------
  list(
    Name = "UrbanAvePopDen_Ma",
    Summarize=list(
      Expr = "sum(UrbanPop) / sum(UrbanArea)",
      Units = c(
        UrbanArea = "ACRE",
        UrbanPop = "PRSN",
        Marea = ""
      ),
      By = "Marea",
      Table = "Bzone"
    ),
    Units = "Persons per acre",
    Description = "Average number of persons per acre in the urbanized area"
  ),

  #Median Bzone population density
  #-------------------------------
  list(
    Name = "MedianBzonePopDen_Ma",
    Summarize=list(
      Expr = "median(D1B)",
      Units = c(
        D1B = "PRSN/ACRE",
        LocType = "Category",
        Marea = ""
      ),
      By = "Marea",
      Table = "Bzone"
    ),
    Units = "Persons per acre",
    Description = "Median Bzone population density in urbanized area"
  ),
  
  list(
    Name = "MedianBzonePopDen_Ma",
    Summarize=list(
      Expr = "median(UrbanPop / UrbanArea)",
      Units = c(
        UrbanPop = "PRSN",
        UrbanArea = "ACRE",
        Marea = ""
      ),
      By = "Marea",
      Table = "Bzone"
    ),
    Units = "Persons per acre",
    Description = "Median Bzone population density in urbanized area"
  ),

  #Average activity density
  #------------------------
  list(
    Name = "AveActivityDen_Ma",
    Summarize=list(
      Expr = "sum(NumHh + TotEmp) / sum(UrbanArea)",
      Units = c(
        NumHh = "HH",
        TotEmp = "PRSN",
        UrbanArea = "ACRE",
        LocType = "category",
        Marea = ""
      ),
      By = "Marea",
      Table = "Bzone"
    ),
    Units = "Households and jobs per acre",
    Description = "Average number of households and jobs per acre in the urbanized area"
  ),
  
  list(
    Name = "AveActivityDen_Ma",
    Summarize=list(
      Expr = "sum(NumHh + TotEmp) / sum(UrbanArea)",
      Units = c(
        NumHh = "HH",
        TotEmp = "PRSN",
        UrbanArea = "ACRE",
        Marea = ""
      ),
      By = "Marea",
      Table = "Bzone"
    ),
    Units = "Households and jobs per acre",
    Description = "Average number of households and jobs per acre in the urbanized area"
  ),

  #Total daily work parking cost
  #-----------------------------
  list(
    Name = "HhTotDailyWkrParkingCost_Ma",
    Summarize=list(
      Expr = "sum(ParkingCost)",
      Units = c(
        ParkingCost = "",
        LocType = "",
        Marea = ""
      ),
      By = "Marea",
      Table = list(
        Worker = c("ParkingCost"),
        Household = c("Marea", "LocType")
      ),
      Key = "HhId"
    ),
    Units = "USD per day",
    Description = "Total daily work parking expenditures by households living in the urbanized portion of the Marea"
  ),

  #Total daily non-work parking cost
  #---------------------------------
  list(
    Name = "HhTotDailyOthParkingCost_Ma",
    Summarize=list(
      Expr = "sum(OtherParkingCost)",
      Units = c(
        OtherParkingCost = "",
        LocType = "",
        Marea = ""
      ),
      By = "Marea",
      Table = "Household"
    ),
    Units = "USD per day",
    Description = "Total daily non-work parking expenditures by households living in the urbanized portion of the Marea"
  ),

  #Proportion of single-family dwelling units
  #------------------------------------------
  list(
    Name = "PropSFDU_Ma",
    Summarize=list(
      Expr = "sum(SFDU) / (sum(NumHh))",
      Units = c(
        SFDU = "DU",
        NumHh = "HH",
        LocType = "category",
        Marea = ""
      ),
      By = "Marea",
      Table = "Bzone"
    ),
    Units = "Proportion of Households",
    Description = "Proportion of urbanized area households that reside in single-family dwellings"
  ),

  list(
    Name = "PropSFDU_Ma",
    Summarize=list(
      Expr = "sum(SFDU) / (sum(NumHh))",
      Units = c(
        SFDU = "DU",
        NumHh = "HH",
        Marea = ""
      ),
      By = "Marea",
      Table = "Bzone"
    ),
    Units = "Proportion of Households",
    Description = "Proportion of urbanized area households that reside in single-family dwellings"
  ),

  #Vehicle trips in urban
  #---------------------------------
  list(
    Name = "UrbanVehicleTrips_Ma",
    Summarize=list(
      Expr = "sum(VehicleTrips)",
      Units = c(
        VehicleTrips = "TRIP/DAY",
        LocType = "",
        Marea = ""
      ),
      By = "Marea",
      Table = "Household"
    ),
    Units = "Trips per day",
    Description = "Average number of vehicle trips per day by household members in urban"
  ),

  #Average Vehicle trip length in urban
  #---------------------------------
  list(
    Name = "UrbanVehTripLen_Ma",
    Summarize=list(
      Expr = "sum(AveVehTripLen)",
      Units = c(
        AveVehTripLen = "MI",
        LocType = "",
        Marea = ""
      ),
      By = "Marea",
      Table = "Household"
    ),
    Units = "Miles",
    Description = "Average household vehicle trip length in miles in urban"
  ),

  #Average car service auto proportion of car service DVMT
  #--------------------------------------------------------------
  list(
    Name = "MareaCarSvcAutoDvmtProp_Ma",
    Summarize=list(
      Expr = " sum(DvmtProp[VehicleAccess != 'Own' & Type == 'Auto']) / sum(DvmtProp[VehicleAccess != 'Own'])",
      Units = c(
        DvmtProp = "",
        VehicleAccess = "",
        Type = "",
        Marea = ""
      ),
      By = "Marea",
      Table = "Vehicle"
    ),
    Units = "Proportion",
    Description = "Average proportion car service vehicle DVMT in autos used by households residing in the Marea"
  ),

  #House hold car service DVMT in Marea
  #-------------------------------------------------------------
  list(
    Name = "MareaHouseholdCarSvcDvmt_Ma",
    Summarize=list(
      Expr = "sum(Dvmt[VehicleAccess != 'Own' ] * DvmtProp[VehicleAccess != 'Own' ])",
      Units = c(
        Dvmt = "MI/DAY",
        DvmtProp = "",
        VehicleAccess = "",
        Marea = ""
      ),
      By = "Marea",
      Table = list(
        Household = c("Dvmt", "Marea"),
        Vehicle = c("DvmtProp", "VehicleAccess")
      ),
      Key = "HhId"
    ),
    Units = "miles per day",
    Description = "Total DVMT in car service vehicles of persons in households and non-institutional group quarters in Marea"
  ),

  #Walk Trips Per Capita
  #------------------------------------
  list(
    Name = "Urban_Ann_Wlk_Per_Cap",
    Function = "(UrbanWalkTrips_Ma*365)/UrbanHhPop_Ma",
    Units = "Trips/Person",
    Description = "Annual Walk Trips Per Capita"
  ),

  #Daily Miles traveled by Bicycle
  #----------------------------------------------
  list(
    Name = "BikeDVMT_Ma",
    Summarize=list(
      Expr = " sum(BikeTrips*AveTrpLenDiverted)",
      Units = c(
        BikeTrips = "",
        AveTrpLenDiverted = "",
        Marea = ""
      ),
      By = "Marea",
      Table = "Household"
    ),
    Units = "Miles/Day",
    Description = "DVMT by Bike"
  ),

  #Bike DVMT Per Capita
  #------------------------------------
  list(
    Name = "BikeDVMT_PerCap_Ma",
    Function = "BikeDVMT_Ma/UrbanHhPop_Ma",
    Units = "Miles/Person/Day",
    Description = "Daily Miles on Bike Per Capita"
  ),

  #Ldv Delay Per Vehicle Trip
  #------------------------------------
  list(
    Name = "Ldv_Delay_Per_Trip",
    Function = "UrbanLdv_TotalDelay_Ma/UrbanVehicleTrips_Ma",
    Units = "Hours/Trip",
    Description = "Daily LDV delay Per Trip"
  ),

  #Household cost of parking - non work
  #------------------------------------
  list(
    Name = "Prk_Cost_nonWrk_PerHh",
    Function = "HhTotDailyOthParkingCost_Ma/UrbanHhNum_Ma",
    Units = "cost/household",
    Description = "Parking Cost Non Work Per Household"
  ),

  #Cost Savings from substituting the use of car services for household vehicles
  #---------------------------------
  list(
    Name = "Cost_Sav_CarSvc_Ma",
    Summarize=list(
      Expr = "sum(OwnCostSavings)",
      Units = c(
        OwnCostSavings = "",
        LocType = "",
        Marea = ""
      ),
      By = "Marea",
      Table = "Household"
    ),
    Units = "$/yr",
    Description = "Annual savings from car service substitution"
  ),

  #Cost Savings Per Household from Car Service substitution
  #------------------------------------
  list(
    Name = "Cost_Sav_CarSvc_PerHh_Ma",
    Function = "Cost_Sav_CarSvc_Ma/UrbanHhNum_Ma",
    Units = "cost/household",
    Description = "Savings per Hh from Car Service Substitution"
  ),

  #Annual emissions per capita
  #------------------------------------
  list(
    Name = "Annual_Em_PC_Ma",
    Function = "(UrbanLdvCO2e_Ma+UrbanBusCO2e_Ma+UrbanHvyTrkCO2e_Ma)/UrbanHhPop_Ma",
    Units = "Tons/Person/Yr",
    Description = "Annual Emissions per capita"
  ),

  #Com Ser CO2e Rate for urban area
  #---------------------------
  list(
    Name = "UrbanComSerAveCO2eRate_Ma",
    Function = "(UrbanComSvcCO2e_Ma * 1000000) / (UrbanComSvcDvmt_Ma * 365)",
    Units = "Grams CO2e per mile",
    Description = "Average greenhouse gas emissions per mile of Commercial Service travel in the urban area"
  ),

  #Annual vehicle fuel consumption per capita
  #------------------------------------
  list(
    Name = "Annual_Fuel_PC_Ma",
    Function = "365*(UrbanLdvGGE_Ma+UrbanBusGGE_Ma+UrbanHvyTrkGGE_Ma)/UrbanHhPop_Ma",
    Units = "Gallons/Person/Yr",
    Description = "Annual Fuel Consumption per capita"
  )

)
