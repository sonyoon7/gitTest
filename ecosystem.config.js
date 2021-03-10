module.exports = {
  apps : [{
    script: 'node bin/www',
    // watch: '.'
  }
  // , {
  //   script: './service-worker/',
  //   watch: ['./service-worker']
  // }
  ],

  deploy : {
    development : {
      user : 'ubuntu',
      host : 'ec2-54-180-152-73.ap-northeast-2.compute.amazonaws.com',
      ref  : 'origin/master',
      repo : 'git@github.com:sonyoon7/gitTest.git',
      path : '/home/ubuntu/test',
      // 'pre-deploy-local': 'scp .env ubuntu@ec2-54-180-152-73.ap-northeast-2.compute.amazonaws.com:/home/ubuntu/gitTest/current/.env',
      // 'post-setup': '',
      'post-deploy' : 'cd /home/ubuntu/test/current/ && docker build .',
      // 'pre-setup': ''
    }
  }
};
