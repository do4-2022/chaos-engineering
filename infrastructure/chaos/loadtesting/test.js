import http from 'k6/http';
import { sleep } from 'k6';

// Define the target URL
const url1 = 'http://vote.votingapp.svc.cluster.local:5000/api';
const url2 = 'http://vote.votingapp-nats.svc.cluster.local:5000/api';


// Define the load stages
const loadStages = [
  { duration: '30s', target: 100 },
  { duration: '30s', target: 200 },
  { duration: '30s', target: 500 },
  { duration: '30s', target: 1000 },
];

export const options = {
  stages: loadStages,
  thresholds: {
    http_req_duration: ['p(95)<200'], // 95% of requests should complete within 200ms
  },
};

export default function () {
  const res1 = http.post(
    url1, 
    JSON.stringify({ 
        vote: Math.random() >= 0.5 ? "a": "b",
        voter_id: `${Math.floor(Math.random() * 1000)}`
    }) 
  );
  const res2 = http.post(
    url2, 
    JSON.stringify({ 
        vote: Math.random() >= 0.5 ? "a": "b",
        voter_id: `${Math.floor(Math.random() * 1000)}`
    }) 
  );
  sleep(1); // Simulate some processing time
}