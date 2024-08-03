#include <bits/stdc++.h>
using namespace std;

/*
Stack<int> implementation in c++ by dede6giu
*/

class stack_bad_action : public exception { 
    private: 
        string message;
    public: 
        stack_bad_action(const char* msg) : message(msg) {}
        
        const char* what() const throw() { 
            return message.c_str(); 
        } 
}; 

class Node {
    private:
        int data;
        Node* next;
    public:
        Node(int x) {
            data = x;
            next = nullptr;
        }
        Node() = default;

        Node* getNext() {
            return next;
        }
        int getData() {
            return data;
        }

        void setNext(Node* ptr) {
            next = ptr;
        }
        void setData(int newdata) {
            data = newdata;
        }
};

class Stack {
    private:
        Node head;
    public:
        Stack() {
            head.setData(0); // meaningless value
            head.setNext(nullptr);
        }

        // checks if the stack is empty
        // O(1)
        bool isEmpty() {
            if (head.getNext() == nullptr) {
                return true;
            }
            return false;
        }

        // adds a value to the top of the stack
        // O(1)
        void add(int data) {
            Node* p = new Node(data);
            p->setNext(head.getNext());
            head.setNext(p);
        }

        // returns the value of the first item
        // O(1)
        int peek() {
            if (isEmpty()) {
                throw stack_bad_action("cannot peek() empty list");
            }
            return (head.getNext())->getData();
        }

        // removes the first item and returns it
        // O(1)
        int pop() {
            if (isEmpty()) {
                throw stack_bad_action("cannot pop() empty list");
            }
            Node* removed = head.getNext();
            int aux_int = removed->getData();
            head.setNext(removed->getNext());
            delete removed; // memory leak prevention
            return aux_int;
        }

        // this implementation is in O(n)
        // it can be made in O(1) if a redundant variable
        // is added onto the Stack. preferably, it can
        // use the head Node null value
        // O(n)
        int length() {
            if (isEmpty()) {
                return 0;
            }
            int count = 1;
            Node* current = head.getNext();
            while (current->getNext() != nullptr) {
                count++;
                current = current->getNext();
            }
            return count;
        }

        // returns the index of the first
        // instance of the item specified
        // returns -1 if not found
        // O(n)
        int find(int x) {
            if (isEmpty()) {
                return -1;
            }
            int index = 0;
            Node* current = &head;
            while (current->getNext() != nullptr) {
                if ((current->getNext())->getData() == x) {
                    return index;
                } else {
                    index++;
                    current = current->getNext();
                }
            }
            return -1;
        }
        
        // returns the index of the first
        // instance of the item specified
        // throws error if not found
        // O(n)
        int index(int x) {
            if (isEmpty()) {
                throw stack_bad_action("cannot index() empty list");
            }
            int index = 0;
            Node* current = &head;
            while (current->getNext() != nullptr) {
                if ((current->getNext())->getData() == x) {
                    return index;
                } else {
                    index++;
                    current = current->getNext();
                }
            }
            throw stack_bad_action("item not in list");
        }
};