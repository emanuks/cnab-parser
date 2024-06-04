# CNAB Parser

#### Description

MVC Ruby on Rails project of a parser for CNAB Files.

This web application has a form for uploading CNAB Files, after uploading a valid CNAB file you'll be able to see all transactions correctly parsed from this file, with income, expense and total values per file.

The parser checks if the file is valid and if each field has the correct format.

This application has devise authentication and Google OAuth, you can either create your own user from scratch or just sing in through Google.

#### CNAB Documentation

| Field     | Start | End | Length | Description                 |
| --------- | ----- | --- | ------ | --------------------------- |
| Type      | 1     | 1   | 1      | Transaction type            |
| Date      | 2     | 9   | 8      | Transaction date            |
| Value     | 10    | 19  | 10     | Transaction value * 100     |
| CPF       | 20    | 30  | 11     | Brazilian taxpayer registry |
| Bank Card | 31    | 42  | 12     | Transaction bank card       |
| Time      | 43    | 48  | 6      | Time in brazilian time zone |
| Owner     | 49    | 62  | 14     | Owner Name                  |
| Nome loja | 63    | 81  | 19     | Store Name                  |

#### Transaction Types

| Type | Description             | Nature  | Signal |
| ---- | ----------------------- | ------- | ------ |
| 1    | Débito                 | Income  | +      |
| 2    | Boleto                  | Expense | -      |
| 3    | Financiamento           | Expense | -      |
| 4    | Crédito                | Income  | +      |
| 5    | Recebimento Empréstimo | Income  | +      |
| 6    | Vendas                  | Income  | +      |
| 7    | Recebimento TED         | Income  | +      |
| 8    | Recebimento DOC         | Income  | +      |
| 9    | Aluguel                 | Expense | -      |

#### How to Run

First you'll need to replace your PG user and password on database.yml file.

You'll also need a master key to run this project, since it has env variables related to Google OAuth, you can contact me for the key.

Create a master.key file inside config folder and paste the master key in it.

Then run the following commands on your terminal.

`rails db:create`

`rails db:migrate`

`rails assets:precompile`

`rails s`

#### How to Test

Simply run on your terminal:

`rspec`
