# COVID-19 Data Exploration Project

## Table of Contents

- [Project Overview](#project-overview)
- [Objectives](#objectives)
- [Tools and Technologies](#tools-and-technologies)
- [Data Sources](#data-sources)
- [Data Cleaning and Preparation](#data-cleaning-and-preparation)
- [Dashboard Design](#dashboard-design)
- [Interactive Visualizations](#interactive-visualizations)
   - [Global Numbers](#global-numbers)
   - [Total Deaths by Continent](#total-deaths-by-continent)
   - [Percentage of Population Infected](#percentage-of-population-infected)
   - [Infection Rate Over Time](#infection-rate-over-time)
   - [Total COVID-19 Cases Over Time](#total-covid-19-cases-over-time)
   - [Total COVID-19 Deaths Over Time](#total-covid-19-deaths-over-time)
- [Key Insights](#key-insights)
- [Challenges and Solutions](#challenges-and-solutions)
- [Conclusion](#conclusion)
- [Future Work](#future-work)
- [Acknowledgments](#acknowledgments)

## Project Overview
This project provides a comprehensive exploration of the global spread of COVID-19. The analysis presents key metrics, trends, and insights into the pandemic’s impact on different regions. The project includes an interactive dashboard that allows users to filter data by country or continent, offering a detailed view of how the virus affected various regions over time.

![covid-dashboard-preview](https://github.com/user-attachments/assets/26c40fd0-d80b-4a7e-8953-17335d172b12)

[Link to SQL code](https://github.com/CStoerck/COVID-Data-Exploration-Project/blob/07db485c40443658d094c95513c830ae8fbebb0e/COVID%20Project%20SQL%20Queries.sql)                                        
[Link to visualization](https://public.tableau.com/app/profile/cody.stoerck/viz/COVIDDashboard_17066628186710/Dashboard1)

## Objectives
- To analyze the global spread of COVID-19 and its impact on different regions.
- To visualize key metrics such as total cases, total deaths, death percentage, and infection rates.
- To provide an interactive dashboard that allows users to filter data by country or continent.
- To track the progression of COVID-19 through cumulative and time-based visualizations.

## Tools and Technologies
- **Excel**: Used for data cleaning, preparation, and preliminary analysis. Excel was instrumental in handling missing values, data formatting, and initial exploratory analysis.
- **SQL**: Used for querying and managing the data. SQL was essential for filtering, aggregating, and joining datasets, enabling efficient data processing and analysis.
- **Tableau**: Used for creating interactive data visualizations. Tableau's powerful visualization capabilities allowed for the development of an intuitive dashboard that users can interact with to gain deeper insights.

## Data Sources
The data used in this project was collected from:
- [Our World in Data COVID-19 Dataset](https://ourworldindata.org/covid-deaths)

## Data Cleaning and Preparation
Data cleaning and preparation were crucial steps in ensuring the accuracy and reliability of the analysis. The process involved:

- **Handling Missing Data**: Missing values were addressed using techniques such as imputation or exclusion, depending on the extent and significance of the missing data.
- **Data Formatting**: Data was standardized to ensure consistency across all datasets, including date formatting, normalization of country and continent names, and ensuring numerical data was properly typed.
- **Data Aggregation**: SQL was used to aggregate data by continent, country, and date, facilitating the analysis of trends across different regions and over time.
- **Outlier Detection**: Outliers were identified and analyzed to determine whether they were legitimate data points or errors in reporting.

## Dashboard Design
The dashboard was designed to be both informative and user-friendly, providing a clear and intuitive interface for exploring the COVID-19 data. The layout is structured to present an overview of global trends:

- **Global Numbers** - A summary section displaying total cases, total deaths, and death percentage globally, offering a quick snapshot of the pandemic's overall impact.
- **Total Deaths by Continent** - A bar chart visualizing the total number of COVID-19 deaths across different continents, highlighting the regions most affected.
- **Percentage of Population Infected** - A world map showing the percentage of the population infected in each country, providing a geographic perspective on the virus's spread.
- **Infection Rate Over Time** - A line chart tracking the global infection rate, illustrating key trends and pandemic waves.
- **Total COVID-19 Cases Over Time** - A cumulative line chart displaying the total number of COVID-19 cases globally.
- **Total COVID-19 Deaths Over Time** - A cumulative line chart showing the total number of COVID-19 deaths, offering insight into the pandemic's mortality trends.

## Interactive Visualizations

### Global Numbers
This section provides a high-level overview of the pandemic's global impact:
- **Total Cases**: The cumulative number of confirmed COVID-19 cases worldwide.
- **Total Deaths**: The cumulative number of deaths attributed to COVID-19.
- **Death Percentage**: The ratio of deaths to total cases, providing insight into the virus's lethality.

### Total Deaths by Continent
A bar chart that visualizes the total number of COVID-19 deaths across different continents. This chart allows users to compare the impact of the pandemic on various regions.

### Percentage of Population Infected
A world map highlighting the percentage of each country's population infected by COVID-19. This interactive map can be filtered by country or continent, offering a detailed view of the virus's spread across different regions.

### Infection Rate Over Time
A line chart that tracks the global infection rate from 2020 to 2024. This chart allows users to filter the data by country or continent, making it easy to explore trends in specific regions.

### Total COVID-19 Cases Over Time
A cumulative line chart showing the total number of COVID-19 cases reported globally from 2020 to 2024. Users can filter this chart by country or continent to analyze the growth trajectory of the pandemic in specific areas.

### Total COVID-19 Deaths Over Time
A cumulative line chart tracking the total number of COVID-19 deaths globally over the same period. This chart can also be filtered by country or continent, providing insights into mortality trends in different regions.

## Key Insights
* **Global Impact**: The data shows significant variation in the impact of COVID-19 across different continents, with Europe experiencing the highest death toll.
* **Infection Trends**: The infection rate peaked during 2022, corresponding with the largest waves of the pandemic. The data also reveals significant differences in infection rates between continents.
* **Mortality Trends**: Despite the increase in total cases, the death percentage has shown a decline over time, likely due to improved healthcare responses and vaccination efforts.
* **Geographic Spread**: The world map visualization indicates that European countries had higher infection rates, possibly due to factors such as population density and healthcare infrastructure.

## Challenges and Solutions

### Data Consistency
Ensuring data consistency across multiple sources was challenging. This issue was addressed by standardizing data formats and using SQL to validate and cross-check data from different sources.

### Handling Large Datasets
The large volume of data required efficient processing and management. SQL was used for complex queries and aggregations, while Excel handled preliminary analysis and data cleaning tasks.

### Creating Interactive Visualizations
Developing interactive and intuitive visualizations for a global dataset required careful design and implementation. Tableau’s advanced features were utilized to create a dashboard that is both user-friendly and informative, allowing users to explore the data in a flexible manner.

## Conclusion
This project provides a thorough exploration of the COVID-19 pandemic, offering valuable insights into its global spread, impact, and progression over time. The interactive dashboard allows users to filter data by country or continent, providing a detailed view of the pandemic's effects on different regions. The combination of data cleaning, SQL querying, and Tableau visualization has resulted in a comprehensive analysis that can serve as a valuable resource for understanding the pandemic’s trajectory.

## Future Work
- **Incorporate Vaccination Data**: Future iterations of this project could include vaccination data to analyze the relationship between vaccination rates and infection/death rates.
- **Detailed Country-Level Analysis**: A more granular analysis focusing on individual countries could provide deeper insights into the factors influencing the spread and impact of the virus.
- **Predictive Analytics**: Implementing predictive models could help forecast future trends based on historical data, providing valuable insights for public health planning.

## Acknowledgments
I would like to thank the data providers, including Johns Hopkins University, WHO, and Our World in Data, for making critical COVID-19 data available to the public. Their contributions have been instrumental in the global response to the pandemic and in enabling projects like this one.

## Contact
- **Cody Stoerck**: [LinkedIn](https://www.linkedin.com/in/codystoerck/) | cstoerck@gmail.com

---

[Link to SQL code](https://github.com/CStoerck/COVID-Data-Exploration-Project/blob/07db485c40443658d094c95513c830ae8fbebb0e/COVID%20Project%20SQL%20Queries.sql)                                         
[Link to visualization](https://public.tableau.com/app/profile/cody.stoerck/viz/COVIDDashboard_17066628186710/Dashboard1)


