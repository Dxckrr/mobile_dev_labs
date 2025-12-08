import admin from 'firebase-admin';

import { createRequire } from 'module';
const require = createRequire(import.meta.url);

const serviceAccount = require('../exam-2-flutter-firebase-adminsdk-fbsvc-2410b97328.json');

admin.initializeApp({
  credential: admin.credential.cert(serviceAccount)
});
export default admin;
