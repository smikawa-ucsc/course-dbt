What is our user repeat rate?
    0.798387
What are good indicators of a user who will likely purchase again? What about indicators of users who are likely NOT to purchase again? If you had more data, what features would you want to look into to answer this question?

Why did you organize the models in the way you did?
    I organized them such that the fact and dim models avoid having large chunks of code and calculations, like aggregates.  I tried to move all the aggregate math into intermediate tables, and then merged them together into the top level focus item(e.g. product, user).
    
    I'm a little shaky on the organization, because it seems odd to have the core facts and dims right in the middle in some instances, but it seemed prudent to draw on those fundamental models rather than rebuild them.

What assumptions are you making about each model?
    I assume that:
        all primary-key type fields should not be null and are unique
        many other values would not make sense if they were null, like a name or email for a user
        many of the numerics only make sense if they are positive values
        For various other fields, there are specific accepted values.  e.g. shipping service, promo status, order status, etc
    I placed most of my tests in the staging models since all others are dependent on them.  I think I could have also placed them at the source level with identical effect since the staging models have such light transforms.

Did you find any “bad” data as you added and ran tests on your models? How did you go about either cleaning the data in the dbt model or adjusting your assumptions/tests?
    Based on the above assumptions, I did not have any bad data.  If I did find bad data, I would adjust the tests unless the data clearly was not consistent with other rows.  I could also add "where" in places where appropriate, probably in the staging models to filter.

Explain how you would ensure these tests are passing regularly and how you would alert stakeholders about bad data getting through.
    Tests can be run whenever there is a change to the transformations to ensure assumptions remain valid.  Failures can be logged to a table in a database and reviewed.

Snapshots: Which orders changed from week 1 to week 2? 
    It looks like there were 3 orders that snapshot updated with new dates and activity
        265f9aae-561a-4232-a78a-7052466e46b7
        e42ba9a9-986a-4f00-8dd2-5cf8462c74ea
        b4eec587-6bca-4b2a-b3d3-ef2db72c4a4f