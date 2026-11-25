# Candy Sales Data Integration

This SQL ETL project combines 1,500 candy sales records from 2022, 2023,
and 2024 into one staging table with a consistent structure.

## What I did

- Mapped each year's fields to a common staging table.
- Combined split-shipment quantities and calculated order totals for 2023.
- Subtracted quantity discounts from order subtotals for 2024.
- Checked the staging output against the assignment checksum of 1,537.

## How to run

Import the three annual CSVs into SQLite as `pd2022`, `pd2023`, and
`pd2024`. Run `JRene_ETL_Candy_Final.SQL` to create and populate
`stagingTable`. The last query displays the combined data.
