import { sample } from 'effector';
import * as auth from 'features/user';
import * as router from 'library/router';
import { formSubmitted, fieldChanged, changeAuthUserFx } from './model';

formSubmitted.watch((e) => e.preventDefault());

auth.model.$user.on(fieldChanged, (state, payload) => ({
  ...state,
  ...payload,
}));

sample({
  source: auth.model.$user,
  clock: formSubmitted,
  target: changeAuthUserFx,
});

changeAuthUserFx.done.watch(() => {
  window.location.reload();
});

auth.model.loggedOutClicked.watch(() => {
  router.model.history.push('/');
});
