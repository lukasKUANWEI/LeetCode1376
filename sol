class Solution {
    public int numOfMinutes(int n, int headID, int[] manager, int[] informTime) {
        if (n == 1) {
            return 0;
        }
        int maxInformTime = 0;
        Map<Integer, List<Integer>> contact = new HashMap<>();
        // use manager as key to retrieve corresponding subordinates 
        for (int i = 0; i < manager.length; i++) {
            if (contact.containsKey(manager[i])) {
                contact.get(manager[i]).add(i);
            } else {
                contact.put(manager[i], new ArrayList<>(Arrays.asList(i)));
            }
        }
        Queue<Integer> queue1 = new ArrayDeque<>(); // store node in BFS
        Queue<Integer> queue2 = new ArrayDeque<>(); // store corresponding node
        queue1.add(headID);
        queue2.add(informTime[headID]);
        while (!queue1.isEmpty()) {
            int currID = queue1.poll();
            int levelTime = queue2.poll();
            maxInformTime = Math.max(maxInformTime, levelTime);
            if (contact.containsKey(currID)) {
                for (int sub : contact.get(currID)) {
                    queue1.add(sub);
                    queue2.add(levelTime + informTime[sub]);
                }
            }
        }
        
        return maxInformTime;
    }
}
