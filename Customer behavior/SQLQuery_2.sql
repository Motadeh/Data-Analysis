ALTER TABLE Loan
ALTER COLUMN ApplicationDate DATE;

ALTER TABLE Loan
ALTER COLUMN JobTenure int;

SELECT *
FROM "Loan";

SELECT
    YEAR(ApplicationDate) as Year,
    case
        when LoanApproved = 0 then 'Declined'
        else 'Approved'
    end as approval_status,
    count(*) as total_applicants,
    avg(Age) as avg_age,
    avg(AnnualIncome) as avg_ann_income,
    avg(TotalAssets) as avg_t_assets,
    avg(TotalLiabilities) as avg_t_liabilities,
    avg(SavingsAccountBalance) as avg_savings,
    avg(JobTenure) as avg_jobtenure,
    avg(TotalDebtToIncomeRatio) as avg_debt_income_ratio

FROM "Loan"
-- where ApplicationDate <= '2025-01-01'
group by YEAR(ApplicationDate), LoanApproved
ORDER BY 1