import pandas as pd, numpy as np
from operator import attrgetter


# Create the required data frames by reading in the files

# Q1 Find least sales amount for each item
# has been solved as an example
def least_sales(df):
    # write code to return pandas dataframe
    ls = df.groupby(["Item"])["Sale_amt"].min().reset_index()
    return ls


# Q2 compute total sales at each year X region
def sales_year_region(df):
    # write code to return pandas dataframe
    return df.groupby([df.OrderDate.apply(attrgetter("year")), "Region"])["Sale_amt"].sum().reset_index()


# Q3 append column with no of days difference from present date to each order date
def days_diff(df):
    # write code to return pandas dataframe
    days_elapsed = (pd.Timestamp.now() - df.OrderDate).apply(attrgetter("days"))
    df['days_diff'] = days_elapsed
    return df


# Q4 get dataframe with manager as first column and  salesman under them as lists in rows in second column.
def mgr_slsmn(df):
    # write code to return pandas dataframe
    # question 4
    sales_people = df.groupby(["Manager"])["SalesMan"].agg(lambda x: list(set(x)))
    return pd.DataFrame({
        "manager": sales_people.index,
        "list_of_salesman": sales_people.values,
    })


# Q5 For all regions find number of salesman and number of units
def slsmn_units(df):
    # write code to return pandas dataframe
    return df.groupby(["Region"]).agg({
        "SalesMan": lambda sales_people: len(sales_people.unique()),
        "Sale_amt": sum
    }).reset_index().rename(columns={"SalesMan": "salesmen_count", "Sale_amt": "total_sales"})


# Q6 Find total sales as percentage for each manager
def sales_pct(df):
    # write code to return pandas dataframe
    return (df.groupby(["Manager"])["Sale_amt"].sum() / df.Sale_amt.sum() * 100
            ).reset_index().rename(columns={"Manager": "manager", "Sale_amt": "percent_sales"})


# Q7 get imdb rating for fifth movie of dataframe
def fifth_movie(df):
    # write code here
    return df.loc[4, "imdbRating"]


# Q8 return titles of movies with shortest and longest run time
def movies(df):
    # write code here
    return df.loc[df.duration.idxmin(), "title"], df.loc[df.duration.idxmax(), "title"]


# Q9 sort by two columns - release_date (earliest) and Imdb rating(highest to lowest)
def sort_df(df):
    # write code here
    return df.sort_values(["year", "imdbRating"], ascending=[True, False])


# Q10 subset revenue more than 2 million and spent less than 1 million & duration between 30 mintues to 180 minutes
def subset_df(df):
    # write code here
    return df[(df.gross > 2_000_000) & (df.budget < 1_000_000) & (df.duration > 30) & (df.duration < 180)]


# Q11 count the duplicate rows of diamonds DataFrame.
def dupl_rows(df):
    # write code here
    return len(df) - len(df.drop_duplicates())


# Q12 droping those rows where any value in a row is missing in carat and cut columns
def drop_row(df):
    # write code here
    return df.dropna(subset=["cut", "carat"])


# Q13 subset only numeric columns
def sub_numeric(df):
    # write code here
    numerics = ['int16', 'int32', 'int64', 'float16', 'float32', 'float64']
    return df.select_dtypes(include=numerics)


# Q14 compute volume as (x*y*z) when depth > 60 else 8
def volume(df):
    # write code here
    volumes = df.x * df.y * df.z
    volumes[df.depth <= 60] = 8
    return volumes


# Q15 impute missing price values with mean
def impute(df):
    # write code here
    return df.price.fillna(df.price.mean())
