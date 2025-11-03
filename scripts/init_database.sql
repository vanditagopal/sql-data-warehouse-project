/* creating a new db called Datawarehouse and adding schemas wihtin  it 'gold','silver','bronze'*/

use master;

create database DataWarehouse;

use DataWarehouse;
GO

CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO
