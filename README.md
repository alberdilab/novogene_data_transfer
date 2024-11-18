# Novogene data transfer

Code for automatic data transfer, unpacking and archiving sequencing data from NovoGene

1. Enter the Novogene data deliver system using the username and password received through email.
2. Check all files and click "Export link" button to download a csv file with all links.
3. Clone this repository and rename it. `mv novogene_data_transfer [my_custom_name]`
4. Place the place the csv containing the links file in the repository directory.
5. Launch the data transfer with the following command.

```
screen -dmS Novogene_Transfer sh novogene_transfer.sh
```
