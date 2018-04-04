export default {
  payload: function () {
    let token          = localStorage.getItem('token');
    let hashed_payload = token.split('.')[1];
    let payload        = atob(hashed_payload);

    return JSON.parse(payload);
  }
}
