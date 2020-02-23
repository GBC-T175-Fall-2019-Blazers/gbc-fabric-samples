const shim = require('fabric-shim');

const mycodesgetdata = class {
    Init(stub) {
        return shim.success();
    }

    async Invoke(stub) {
        let ret = stub.getFunctionAndParameters();

        let method = this[ret.fcn];
        if (!method) {
          console.log('no function of name:' + ret.fcn + ' found');
          throw new Error('Received unknown function ' + ret.fcn + ' invocation');
        }
        try {
          let payload = await method(stub, ret.params);
          return shim.success(payload);
        } catch (err) {
          console.log(err);
          throw new Error(err);
        }
    }

    async saveData(stub, params) {
        let param0 = params[0];
        let param1 = params[1];

        // await stub.putState(param0, Buffer.from(param1.toString()));

        // var saved = await stub.putState(params[0], Buffer.from(params[1]));
        // return "Success";
        // return shim.success(Buffer.from('saveData Successful!'));
        return shim.success();

    }

    async getData(stub, params) {
        var value = await stub.getState(params[0]);
        // return value.toString();
        // return shim.success(Buffer.from('gatData Successful!'));
        return shim.success();

    }
};

shim.start(new mycodesgetdata());
