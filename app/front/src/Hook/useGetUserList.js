export default function useGetUserList() {
  return function() {
    return fetch('http://localhost:8245/api/user/list', {
      method: 'GET',
      mode: "cors",
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJtZXJjdXJlIjp7InN1YnNjcmliZSI6WyJodHRwczovL2V4YW1wbGUuY29tL3VzZXIvMS97P3RvcGljfSJdLCJwYXlsb2FkIjp7InVzZXJuYW1lIjoiRWxpc2UiLCJ1c2VyaWQiOjF9fX0.UmcD69mVz_kbGPFpt645fVJ0L6O7kZ6Dq5y1nBfoHOY'
      }
    })
      .then(data => data.json())
  }
}