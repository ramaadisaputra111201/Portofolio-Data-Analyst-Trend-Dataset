# Portofolio Data Analyst : Trend Dataset

In the retail and fashion industry, a product’s “Trending” status plays a crucial role in driving sales growth, brand exposure, and strategic decisions related to inventory and marketing. However, not all products with high sales volume, low prices, or popular brands automatically become trending.

Without proper data analysis, it is difficult to clearly understand: 
What factors truly make a product trend?
Whether trending is driven by price, popularity, brand, or customer perception.

Therefore, this project was conducted to identify the key drivers behind a product becoming trending using Exploratory Data Analysis (EDA) with SQL and Excel for visualization.

**Objective**

The main objectives of this analysis are to:
* Identify key differences between Trending and Non-Trending products
* Evaluate multiple hypotheses related to product attributes and customer perception
* Determine the most influential factors contributing to trending status
* Provide actionable business recommendations based on data-driven insights

**Dataset Overview**

The dataset contains fashion product information with the following key variables:
* ID int 
* Brand text 
* Category text
* Color text
* Material text
* Style text
* Gender text
* Season text
* Price(USD) double
* Popularity_Score double
* Customer_Rating double
* Trend_Status text

Each row represents a single product with its complete attributes.

**Tools & Skills Used**

* SQL (CTE, Window Functions, Aggregations)
* Exploratory Data Analysis (EDA)
* Hypothesis Testing
* Business Insight Development
* Data Storytelling & Visualization

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

**Exploratory Data Analysis**

<img width="478" height="286" alt="image" src="https://github.com/user-attachments/assets/4e38d497-54d9-4758-b6d6-7ef0d656b8b8" />

From the results above, it can be seen that 28% of products (42 products) are trending. Therefore, we will look for factors that influence these products to become trending products.

1. Does a higher Popularity Score lead to a product becoming trending?

<img width="336" height="196" alt="image" src="https://github.com/user-attachments/assets/b87a9a38-2fce-46b5-bba5-f8c9501cd97b" />

Popularity Score isn't the primary factor determining trending, but it does serve as a supporting signal. Trending products don't necessarily have the highest popularity score, but products with low popularity are almost never trending.

2. Does Customer Rating influence trending status?

<img width="498" height="306" alt="image" src="https://github.com/user-attachments/assets/13192089-c794-4790-b78d-602f420ae191" />

Customer Rating is the most consistent factor differentiating trending and non-trending products. Trending products consistently have higher average ratings, indicating that customer satisfaction is the primary driver of trending, not just sales volume.

3. Are products trending because they are cheaper?

<img width="498" height="298" alt="image" src="https://github.com/user-attachments/assets/ef31a5dd-ccc0-4122-a0e5-3389e9352472" />

Low prices aren't the driving force behind trends. Trending products actually command higher prices because customers are willing to pay a premium for products with high ratings and perceived quality.

4. Do specific colors dominate trending products?

<img width="495" height="294" alt="image" src="https://github.com/user-attachments/assets/419a8beb-f1d8-43c4-a0c0-c9e2dd26085e" />  <img width="498" height="296" alt="image" src="https://github.com/user-attachments/assets/37861a04-eb7a-4bc8-bb74-05180b59fa17" />

Beige is the color most frequently featured in trending products, but it serves as a supporting factor, not the primary driver. The color tends to enhance the appeal of products that already have high ratings, rather than creating trends on its own.

5. Do certain materials increase the likelihood of trending?

<img width="498" height="297" alt="image" src="https://github.com/user-attachments/assets/d8912f62-4f64-43ae-ad96-4fa6b72a1f3d" />  <img width="497" height="294" alt="image" src="https://github.com/user-attachments/assets/2f664a62-493a-4c14-9545-c3dfc637743e" />

Materials like leather tend to appear in trending products, but their impact is highly contextual to the season. This means that material isn't a universal driver, but rather a conditional one.

6. Does product style determine trending?

<img width="493" height="292" alt="image" src="https://github.com/user-attachments/assets/b5a2b7fe-6401-49b5-bccf-75995e1ebb0f" />  <img width="496" height="293" alt="image" src="https://github.com/user-attachments/assets/7d39f8ad-f229-458d-b775-ce907dbbce32" />

Style is not a causal factor in trends. Style reflects general market preferences, while trends are determined by how customers perceive the product experience.

7. Does a popular brand guarantee a product will trend?

<img width="498" height="295" alt="image" src="https://github.com/user-attachments/assets/2dec62a9-fc99-4523-bcdf-da1b42756f05" />  <img width="496" height="292" alt="image" src="https://github.com/user-attachments/assets/784a07f4-59f6-4b5a-8472-4f31316b64d0" />

Big brands increase exposure, but they don't guarantee trending. Products from popular brands can still become outdated if they fail to meet customer expectations, while certain brands (like H&M) trend more frequently due to consistent quality and ratings.

8. Do attribute combinations (color, material, brand) drive trending?

<img width="752" height="352" alt="image" src="https://github.com/user-attachments/assets/4f069510-b734-4bcb-82b3-bdbd160784fb" />

Tidak ditemukan kombinasi atribut statis yang menjamin trending. Hal ini mengindikasikan bahwa trending bersifat emergent, dipicu oleh customer experience (rating), bukan spesifikasi produk semata.

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

**Conclusion**

Trending isn't about "what the product is," but "how customers perceive it."
Customer Rating is a leading indicator, while other attributes only reinforce or accelerate the trending effect.

or 

Customer Rating is the primary factor that drives a product to become trending.
Other attributes such as price, brand, style, material, and color serve as supporting elements but do not independently determine trending status. Products trend when they deliver exceptional customer experience, reflected in high ratings and strong social validation.


**Business Recommendations (Action Items)**

1. Prioritize customer experience improvements
* Enhance product quality and post-purchase service
* Actively promote products with high customer ratings

2. Use customer rating as an early trending indicator
* Monitor products exceeding rating thresholds (e.g., ≥ 4.5)
* Encourage customers to leave reviews after purchase

3. Optimize visual and seasonal strategy
* Leverage neutral colors such as beige for high-potential products
* Align material selection with seasonal demand patterns

4. Shift from price-based to value-based strategies
* Avoid relying solely on aggressive discounting
* Focus on perceived value and customer trust
