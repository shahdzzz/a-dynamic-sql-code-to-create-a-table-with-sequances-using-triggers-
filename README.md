# Dynamic Trigger-Based Table Creation with Sequences using PL/SQL

![Project Logo](project_logo.png)

Welcome to the **Dynamic Trigger-Based Table Creation with Sequences** project! This project aims to provide a flexible and automated solution for creating tables and associated triggers with sequences using PL/SQL in Oracle Database.

## Table of Contents

- [Project Overview](#project-overview)
- [Features](#features)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
- [Usage](#usage)
- [Configuration](#configuration)
- [Examples](#examples)
- [Contributing](#contributing)

## Project Overview

When working with databases, it's common to encounter situations where you need to create tables dynamically based on certain criteria. This project provides a solution that utilizes PL/SQL to create tables and associated triggers with sequences in an automated way. This can be particularly useful for scenarios where you have to manage a large number of similar tables or when the structure of the tables needs to evolve over time.

## Features

- **Dynamic Table Creation:** Automatically generate table creation statements based on provided parameters.
- **Trigger Generation:** Generate triggers for automatically incrementing sequence values when inserting into the created tables.
- **Customization:** Configure the table structure, sequence names, and trigger behavior according to your needs.

## Getting Started

### Prerequisites

- Oracle Database installed and configured.
- Basic understanding of SQL and PL/SQL.

### Installation

1. Clone this repository to your local machine.
2. Connect to your Oracle Database using a SQL client.

## Usage

1. Open the SQL client and connect to your Oracle Database.
2. Run the `setup.sql` script to create necessary objects and initialize the project.
3. Modify the parameters in the `create_table_trigger.sql` script according to your requirements.
4. Execute the `create_table_trigger.sql` script to generate and execute the necessary PL/SQL statements for table creation and trigger generation.

## Configuration

The `create_table_trigger.sql` script contains customizable parameters that allow you to configure the behavior of the dynamic table creation and trigger generation process. Modify these parameters to suit your needs.

- `p_table_name`: The name of the table to be created.
- `p_column_definitions`: List of column definitions for the table.
- `p_primary_key`: The primary key column for the table.
- `p_sequence_name`: The name of the sequence associated with the trigger.
- `p_trigger_name`: The name of the trigger to be created.
- `p_trigger_logic`: The logic for the trigger (e.g., incrementing the sequence).

## Examples

For a demonstration, refer to the `example.sql` script provided in the repository. This script showcases how to create a dynamic table and associated trigger using the provided PL/SQL solution.

```sql
-- Example usage of the dynamic table creation and trigger generation
@example.sql
```

## Contributing

Contributions to this project are welcome! If you find any issues or have ideas for improvements, feel free to open an issue or create a pull request.



We hope this project helps you automate and simplify the process of creating dynamic tables with triggers and sequences in your Oracle Database. If you have any questions or need assistance, please don't hesitate to reach out.

Happy coding!
