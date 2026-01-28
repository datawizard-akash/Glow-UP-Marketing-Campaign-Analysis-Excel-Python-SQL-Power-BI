select * from campaign

-- Campaign Spend: Total money spent per campaign.

select channel, round(sum(spend)::numeric,2) as total_spent
from campaign
group by 1
order by 2 desc

-- Leads Generated: Number of potential customers acquired.

select channel, sum(leads_generated) as total_leads_generated
from campaign
group by 1
order by 2 desc;

-- Conversions: Number of customers who made a purchase.

select campaign_name, sum(conversions)
from campaign
group by 1 
order by 2 desc;


-- Revenue Generated: Total sales attributable to each campaign.

select channel, round(sum(revenue_generated)::numeric,2)
from campaign
group by 1 
order by 2 desc;



-- ROI (%): (Revenue – Spend) / Spend × 100

select channel, concat(round((sum(revenue_generated) - sum(spend)) / sum(spend) * 100), '%') as roi_percent
from campaign 
group by 1
order by 2 desc;

-- Cost per Acquisition (CPA): Spend ÷ Conversions

select channel, round((sum(spend::numeric) / sum(conversions)),2) as cpa
from campaign 
group by 1
order by 2 desc;


-- Engagement Metrics: Clicks, impressions, social media likes/shares

select channel, round(sum(clicks)) as total_clicks, round(sum(impressions)) as total_impressions
from campaign
group by 1 

