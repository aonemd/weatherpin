import jwtDecoder from './jwtDecoder';

export default {
  authenticated: function () {
    let payload = jwtDecoder.payload();
    if (payload != null) {
      return (payload['user_id'] != null);
    }
    else {
      return false;
    }
  }
}
