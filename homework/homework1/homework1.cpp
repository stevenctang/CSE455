#include<iostream>
#include <algorithm>

using namespace std;

struct list {
	struct list *prev;
	double data;
	struct list *next;
} *node = NULL, *first = NULL, *last = NULL, *node1 = NULL, *node2 = NULL;

class linkedlist {
public:
	void insert_beginning() {
		list *insert = new list;
		cout << "Enter value for the node:" << endl;
		cin >> insert->data;
		if(first == NULL) {
			insert->prev = NULL;
			insert->next = NULL;
			first = insert;
			last = insert;
			cout << "Linked list Created!" << endl;
		}
		else {
			insert->prev = NULL;
			first->prev = insert;
			insert->next = first;
			first = insert;
			cout << "Data Inserted at the beginning of the Linked list!" << endl;
		}
	}
	
	void display() {
		node = first;
		cout << "List of data in Linked list: " << endl;
		while(node != NULL) {
			cout << node->data << endl;
			node = node->next;
		}
	}

	void del() {
		double count = 0, number, i;
		node = node1 = node2 = first;
		for(node = first; node != NULL; node = node->next)
			cout << "Enter value for the node:" << endl;
		count++;
		display();
		cout << count << " nodes available here!" << endl;
		cout << "Enter the node number which you want to delete:" << endl;
		cin >> number;
		if(number != 1) {
			if(number < count && number > 0) {
				for(i = 2; i <= number; i++)
					node = node->next;
				for(i = 2; i <= number-1; i++)
					node1 = node1->next;
				for(i = 2; i <= number+1; i++)
					node2 = node2->next;
				node2->prev = node1;
				node1->next = node2;
				node->prev = NULL;
				node->next = NULL;
				node = NULL;
			}
			else if(number == count) {
				node = last;
				last = node->prev;
				last->next = NULL;
				node = NULL;
			}
			else
				cout << "Invalid node number!" << endl;
		}
		else {
			node = first;
			first = node->next;
			first->prev = NULL;
			node = NULL;
		}
		cout << "Node deleted!" << endl;
	}
	
};

int main() {
	int usr_choice;
	linkedlist dllist = linkedlist();
	while(usr_choice != 3) {
		cout << "1. Insert \n2. Delete\n3. Display" << endl;
		cout << "Enter your choice:" << endl;
		cin >> usr_choice;
		switch(usr_choice) {
			case 1:
				dllist.insert_beginning();
				break;
			case 2:
				dllist.del();
				//cout << "New list: " << endl;
				//dllist.display();
				break;
			case 3:
				dllist.display();
				break;
			default:
				cout << "Invalid choice!" << endl;
		}
	}
	return 0;
}