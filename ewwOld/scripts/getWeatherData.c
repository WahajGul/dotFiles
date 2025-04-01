
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <jansson.h>

int main(int argc, char *argv[]) {
    if (argc != 2) {
        fprintf(stderr, "Usage: %s --desc | --temp\n", argv[0]);
        return 1;
    }

    json_t *root;
    json_error_t error;

    // Load the JSON file
    root = json_load_file("./data/weather_copy.json", 0, &error);
    if (!root) {
        fprintf(stderr, "Error loading JSON: %s\n", error.text);
        return 1;
    }

    if (strcmp(argv[1], "--desc") == 0) {
        // Access the 'weather' array
        json_t *weather_array = json_object_get(root, "weather");
        if (!json_is_array(weather_array)) {
            fprintf(stderr, "'weather' is not an array\n");
            json_decref(root);
            return 1;
        }

        // Get the first object in the 'weather' array
        json_t *weather_obj = json_array_get(weather_array, 0);
        if (!json_is_object(weather_obj)) {
            fprintf(stderr, "First element in 'weather' is not an object\n");
            json_decref(root);
            return 1;
        }

        // Get the 'description' field
        json_t *description = json_object_get(weather_obj, "description");
        if (!json_is_string(description)) {
            fprintf(stderr, "'description' is not a string\n");
            json_decref(root);
            return 1;
        }

        // Print the description
        printf("%s\n", json_string_value(description));

    } else if (strcmp(argv[1], "--temp") == 0) {
        // Access the 'main' object
        json_t *main_obj = json_object_get(root, "main");
        if (!json_is_object(main_obj)) {
            fprintf(stderr, "'main' is not an object\n");
            json_decref(root);
            return 1;
        }

        // Get the 'temp' field
        json_t *temp = json_object_get(main_obj, "temp");
        if (!json_is_number(temp)) {
            fprintf(stderr, "'temp' is not a number\n");
            json_decref(root);
            return 1;
        }

        // Print the temperature limited to two decimal places
        printf("%.2f\n", json_number_value(temp));

    } else {
        fprintf(stderr, "Invalid argument: %s\n", argv[1]);
        json_decref(root);
        return 1;
    }

    json_decref(root);
    return 0;
}
