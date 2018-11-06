static int delaay = 1;

abstract class SortBase {
  String name;
  int[] data;
  int runCount;
  SortBase() {
  }
  SortBase(String name, int n) {
    this.name = name;
    data = new int[n];
    for (int i = 0; i < n; i++) {
      data[i] = i + 1;
    }
    runCount = 0;
  }
  void shuffle() {
    // Fisher-Yates
    int n = data.length;
    for (int i = n - 1; 1 <= i; i--) {
      int j = (int)random(i);
      int t = data[i];
      data[i] = data[j];
      data[j] = t;
    }
  }
  void randomize(int n) {
    for (int i = 0; i < n; i++) {
      int j = (int)random(data.length);
      int k = (int)random(data.length);
      int t = data[j];
      data[j] = data[k];
      data[k] = t;
    }
  }
  abstract void sort();
}

class SimpleSort extends SortBase {
  SimpleSort(String name, int n) { 
    super(name, n);
  }

  void sort() {
    runCount++;
    for (int i = 0; i < data.length; i++) {
      int minIdx = i;
      for (int j = i + 1; j < data.length; j++) {
        delay(delaay);
        if (data[j] < data[minIdx]) {
          minIdx = j;
        }
      }
      int t = data[i];
      data[i] = data[minIdx];
      data[minIdx] = t;
    }
    runCount--;
  }
}

class BubbleSort extends SortBase {
  BubbleSort(String name, int n) { 
    super(name, n);
  }

  void sort() {
    runCount++;
    for (int i = 0; i < data.length - 2; i++) {
      for (int j = 1; j < data.length - i; j++) {
        delay(delaay);
        if (data[j] < data[j - 1]) {
          int t = data[j - 1];
          data[j - 1] = data[j];
          data[j] = t;
        }
      }
    }
    runCount--;
  }
}

class QuickSort extends SortBase {
  QuickSort(String name, int n) { 
    super(name, n);
  }

  private void qsort(int [] a, int start, int count) {
    int sum = 0;
    for (int i = start; i < start + count; i++) {
      delay(delaay);
      sum += a[i];
    }
    int m = sum/count;
    //println("qsort: m = " + m);
    int[] a1 = new int[0];
    int[] a2 = new int[0];
    for (int i = start; i < start + count; i++) {
      delay(delaay);
      if (a[i] <= m) {
        a1 = append(a1, a[i]);
      } else {
        a2 = append(a2, a[i]);
      }
    }
    int idx = start;
    for (int i = 0; i < a1.length; i++) {
      a[idx++] = a1[i];
    }
    for (int i = 0; i < a2.length; i++) {
      a[idx++] = a2[i];
    }
    //println("qsort: a1.length = " + a1.length);
    //println("qsort: a2.length = " + a2.length);
    if (1 < a1.length) {
      qsort(a, start, a1.length);
    }
    if (1 < a2.length) {
      qsort(a, start + a1.length, a2.length);
    }
  }

  void sort() {
    runCount++;
    qsort(data, 0, data.length);
    runCount--;
  }
}

class CombSort extends SortBase {
  CombSort(String name, int n) { 
    super(name, n);
  }

  void sort() {
    runCount++;
    int h = data.length * 10 / 13;

    while (true) {
      int swaps = 0;
      for (int i = 0; i + h < data.length; ++i) {
        delay(delaay);
        if (data[i] > data[i + h]) {
          int t = data[i];
          data[i] = data[i + h];
          data[i + h] = t;
          ++swaps;
        }
      }
      if (h == 1) {
        if (swaps == 0) {
          break;
        }
      } else {
        h = h * 10 / 13;
      }
    }
    runCount--;
  }
}