# Linux Screen Manager Scripts

Simple bash scripts to create and delete multiple screen sessions in Linux.

## Scripts

### Make scripts executable
```bash
chmod +x multi_screen.sh delete_screens.sh
```


### multi_screen.sh
Creates multiple screen sessions with sequential numbers.

Usage:

```bash
./multi_screen.sh <screen_name> <start_number> <end_number>
```
Example: ./multi_screen.sh my_screen 1 5

This will create 5 screen sessions named my_screen_1, my_screen_2, my_screen_3, my_screen_4, and my_screen_5.



### delete_screens.sh
Deletes multiple screen sessions with sequential numbers.

Usage:

```bash
./delete_screens.sh <screen_name> <start_number> <end_number>
```

Example: ./delete_screens.sh my_screen 1 5

This will delete 5 screen sessions named my_screen_1, my_screen_2, my_screen_3, my_screen_4, and my_screen_5.


