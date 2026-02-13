echo "=== Linked List ===" >> performance.txt
{ time ./fuzzy-test-gpu-julian-impl-linked-list; } 2>> performance.txt
echo "=== Red-Black Tree ===" >> performance.txt

{ time ./fuzzy-test-gpu-julian-impl-RBTree; } 2>> performance.txt