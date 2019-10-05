/*
    Example of use of the library CSV.h
    By: Pietro Jomini
*/

#include "./includes.c"

/*
    The lib allow you to store each row in a struct defined 
    by the user.
*/
typedef struct _mystruct {
    int rank;
    char *name;
    char *platform;
    int year;
    char *genre;
    char *publisher;
    double NA_Sales;
    double EU_Sales;
    double JP_Sales;
    double other_sales;
    double global_sales;
} mystruct;

/*
    Since the lib parse the rows in strings, you have to
    provide a function to "translate" a series of string in 
    the structure.

    The function must be of type void,
    and it must get as parameters a void *pointer to
    the start of the struct and a tokenized string.

    Tokens are indexed in the order that they have in the file.

    Each tokenized line is cleaned after passing her to the function, 
    hence the structure should store clean data and not pointer, example:
    BAD: ((mystruct*)ptr)->name = line.tokens[1];
    GOOD: ((mystruct*)ptr)->name = strdup(line.tokens[1]);
*/
void my_tokens_to_struct (void *ptr, CSV_tokenized_line line) {
    ((mystruct*)ptr)->rank = atoi(line.tokens[0]);
    ((mystruct*)ptr)->name = strdup(line.tokens[1]);
    ((mystruct*)ptr)->platform = strdup(line.tokens[2]);
    ((mystruct*)ptr)->year = atoi(line.tokens[3]);
    ((mystruct*)ptr)->genre = strdup(line.tokens[4]);
    ((mystruct*)ptr)->publisher = strdup(line.tokens[5]);
    ((mystruct*)ptr)->NA_Sales = atof(line.tokens[6]);
    ((mystruct*)ptr)->EU_Sales = atof(line.tokens[7]);
    ((mystruct*)ptr)->JP_Sales = atof(line.tokens[8]);
    ((mystruct*)ptr)->other_sales = atof(line.tokens[9]);
    ((mystruct*)ptr)->global_sales = atof(line.tokens[10]);
    return;
}

int main() {

    // limiters
    const unsigned int max_lines = 30000, max_rows = 100, max_lines_lenght = 1024;
    // the character of separation between the line tokens.
    const char *separator = ",";

    // Openning the csv file and checking it's existance.
    FILE *csv = fopen("./vgsales.csv", "r");
    if (csv == NULL) return -1;

    // Get the header.
    // If the header is present in the file,
    // it must be done, otherwise it would be took as a line.
    CSV_tokenized_line header = CSV_get_header(csv, separator, max_lines_lenght, max_rows);

    // Parse the CSV in an array of structure
    // the parser return the number of effective elements in the array.
    // The lenght of the array must be the same as the max_rows parameter of the CSV_parse function.
    mystruct parsed_csv[max_lines];
    unsigned int n_items = CSV_parse(csv, parsed_csv, sizeof(mystruct), separator, max_lines, max_rows, max_lines_lenght, my_tokens_to_struct);

    // Since we don't need him anymore, 
    // the csv file is being closed.
    fclose(csv);

    // Test.
    // PS: the rank 654 is missing in the source code,
    // so from there there will be an error in the correspondence
    // between input and output.
    int rank;
    printf("Rank to display? ");
    scanf("%d", &rank);
    rank -= 1;
    printf("\t - Rank: %d", parsed_csv[rank].rank);
    printf("\n\t - Name: %s", parsed_csv[rank].name);
    printf("\n\t - Platform: %s", parsed_csv[rank].platform);
    printf("\n\t - year: %d", parsed_csv[rank].year);
    printf("\n\t - Genre: %s", parsed_csv[rank].genre);
    printf("\n\t - Publisher: %s", parsed_csv[rank].publisher);
    printf("\n\t - NA_Sales: %f", parsed_csv[rank].NA_Sales);
    printf("\n\t - Eu_Sales: %f", parsed_csv[rank].EU_Sales);
    printf("\n\t - JP_Sales: %f", parsed_csv[rank].JP_Sales);
    printf("\n\t - Other_Sales: %f", parsed_csv[rank].other_sales);
    printf("\n\t - Global_Sales: %f", parsed_csv[rank].global_sales);
    printf("\n");

    // Since strdup allocate memory, we need to free ot
    for (int i = 0; i < n_items; i++) {
        free(parsed_csv[i].name);
        free(parsed_csv[i].publisher);
        free(parsed_csv[i].platform);
        free(parsed_csv[i].genre);
    }

    return 0;
}